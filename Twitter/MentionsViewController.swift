//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import MBProgressHUD

class MentionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mentions: [Tweet]!
    var tweet: Tweet!
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "didRefresh", forControlEvents: .ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        //        let navBarColor = navigationController!.navigationBar
        //        navBarColor.barTintColor = UIColor(red:  0/255.0, green: 132/255.0, blue: 237.0/255.0, alpha: 100.0/100.0)
        
        getMentionsTweets()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    func getMentionsTweets() {
        TwitterClient.sharedInstance.mentions(nil,
            completion: { (mentions, error) -> () in
                MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                
                
                
                if (mentions != nil) {
                    var tempTweets : [Tweet]! = mentions
                    tempTweets.sortInPlace { $0.createdAt!.compare($1.createdAt!) == .OrderedDescending }
                    let n = max(20, tempTweets.count)
                    self.mentions = Array(tempTweets.prefix(n))
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    self.tableView.reloadData()
                    
                    self.refreshControl.endRefreshing()
                }
        })
    }
    
    func didRefresh()
    {
        getMentionsTweets()
    }
    
    
//    @IBAction func onLogout(sender: AnyObject) {
//        
//        User.currentUser?.logout()
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.mentions?.count {
            return max(20, count)
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView
            .dequeueReusableCellWithIdentifier("MentionsCell", forIndexPath: indexPath) as! MentionsCell
        self.mentions.sortInPlace { $0.createdAt!.compare($1.createdAt!) == .OrderedDescending };
        cell.mention = self.mentions[indexPath.row]
        return cell
    }
    
   	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        let cell = sender as? TweetCell
//        if cell != nil {
//            let indexPath = tableView.indexPathForCell(cell!)
//            let tweet = mentions[indexPath!.row]
//            let vc = segue.destinationViewController as! TweetDetailsViewController
//            
//            vc.tweet = tweet
//        }
//        else {
//            let cell = sender as? UIBarButtonItem
//            if cell != nil{
//                let vc = segue.destinationViewController as! ComposeViewController
//            }
//        }
//    }
}