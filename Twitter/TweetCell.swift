//
//  TweetCell.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    @IBOutlet weak var tweetTextLabel: UILabel!
   // @IBOutlet weak var favouritedLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            tweetTextLabel.text = tweet?.text
            
//            let timestamp = tweet?.createdAt!
//            timestampLabel.text = timeAgoSinceDate(timestamp!)
//            
//            if tweet?.user != nil {
//                tweetUserLabel.text = "@\(tweet!.user!.screenName!)"
//                profileImageView.setImageWithURL(tweet?.imageUrl)
//                realNameLabel.text = tweet?.user!.name
//            }
////            
//            if tweet?.favourited == true {
//                favouritedLabel.text = "favorited"
//            } else {
//                favouritedLabel.hidden = true
//            }
////
//            if tweet?.retweeted == true {
//                retweetedLabel.text = "retweeted"
//            } else {
//                retweetedLabel.hidden = true
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
