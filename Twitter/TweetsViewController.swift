//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets: [Tweet]!
    var tweet: Tweet!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getTimelineTweets()

        
        
        // Do any additional setup after loading the view.
    }
    
    
    func getTimelineTweets(){
        TwitterClient.sharedInstance.homeTimelineWithCompletion(nil, completion: { (tweets, error) -> () in
        self.tweets = tweets
        self.tableView.reloadData()
    //
    //            for tweet in tweets!{
    //            print(tweet)}
    
    })
        
    }


    @IBAction func onLogout(sender: AnyObject) {
    
        User.currentUser?.logout()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.tweets?.count   { //Tweet.tweetsTimeline?.count {
            print (count)
            return count
            
        }
        return 0
    }
    
    


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell =  tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        
        // print(Tweet.tweetsTimeline![indexPath.row])
        //print(Tweet.tweetsTimeline?.first)
        // cell.tweetTextLabel.text =  (self.tweets![indexPath.row].text!) ?? "" //as? String
        //self.tweets!.[indexPath.row][tweet]["text"] as? String
        // cell.favouritedLabel = Tweet.[indexpath.row
        // [indexPath.row]["title"] as? String
        cell.tweet = self.tweets![indexPath.row] //Tweet.tweetsTimeline![indexPath.row]
        //print(Tweet.tweetsTimeline![indexPath.row])
        return cell
        
}

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setTweet1(tweet: Tweet) {
//        self.tweet = tweet
//    }
	
}


//func tableView

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


