//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import MBProgressHUD

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	var tweets: [Tweet]!
	var tweet: Tweet!
    var refreshControl: UIRefreshControl!

    @IBOutlet weak var composeTweetButton: UIBarButtonItem!
	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {

		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "didRefresh", forControlEvents: .ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(red:  0/255.0, green: 132/255.0, blue: 237.0/255.0, alpha: 100.0/100.0)

		getTimelineTweets()
	}

	func getTimelineTweets() {
		TwitterClient.sharedInstance.homeTimelineWithCompletion(nil,
			completion: { (tweets, error) -> () in
                MBProgressHUD.showHUDAddedTo(self.view, animated: true)

               

				if (tweets != nil) {
					var tempTweets : [Tweet]! = tweets
					tempTweets.sortInPlace { $0.createdAt!.compare($1.createdAt!) == .OrderedDescending }
					let n = max(20, tempTweets.count)
					self.tweets = Array(tempTweets.prefix(n))
                     MBProgressHUD.hideHUDForView(self.view, animated: true)
					self.tableView.reloadData()
                    
                     self.refreshControl.endRefreshing()
				}
		})
	}
    
    func didRefresh()
    {
        getTimelineTweets()
    }
    
    
	@IBAction func onLogout(sender: AnyObject) {

		User.currentUser?.logout()
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let count = self.tweets?.count {
			return max(20, count)
		}
		return 0
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let cell = tableView
			.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
		self.tweets.sortInPlace { $0.createdAt!.compare($1.createdAt!) == .OrderedDescending };
		cell.tweet = self.tweets[indexPath.row]
		return cell
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		let cell = sender as? TweetCell
		if cell != nil {
			let indexPath = tableView.indexPathForCell(cell!)
			let tweet = tweets[indexPath!.row]
			let vc = segue.destinationViewController as! TweetDetailsViewController

			vc.tweet = tweet
		}
        else {
            let cell = sender as? UIBarButtonItem
            if cell != nil{
            let vc = segue.destinationViewController as! ComposeViewController
            }
        }
	}
}