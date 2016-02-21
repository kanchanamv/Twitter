//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Kanch on 2/20/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var detailsHandleLabel: UILabel!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var detailsRetweetButton: UIButton!
    @IBOutlet weak var detailsReplyButton: UIButton!
    @IBOutlet weak var detailsFavouriteButton: UIButton!
    
    @IBOutlet weak var detailsTweetLabel: UILabel!
    
    var tweet : Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsHandleLabel.text = tweet.user?.Screenname
        detailsImageView.setImageWithURL(NSURL(string: tweet!.user!.profileImageUrl!)!, placeholderImage: nil)
        detailsNameLabel.text = tweet.user?.name
        detailsTweetLabel.text = tweet.text
        detailsTextView.text = tweet.user?.Screenname!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retweetOnClicked(sender: AnyObject) {
        let id : Int64 = Int64(self.tweet.id)!
        TwitterClient.sharedInstance.retweet(id)
    }

    @IBAction func favoriteOnClicked(sender: AnyObject) {
        let id : Int64 = Int64(self.tweet.id)!
        TwitterClient.sharedInstance.favorite(id)
    }
    
    @IBAction func replyOnClicked(sender: AnyObject) {
        TwitterClient.sharedInstance.reply(detailsTextView.text, id: "\(self.tweet.id)")
    }
    
}
