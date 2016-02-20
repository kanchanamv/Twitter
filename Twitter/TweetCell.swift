//
//  TweetCell.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var favourited: UILabel!
    @IBOutlet weak var reTweeted: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var profileImageview: UIImageView!
   // @IBOutlet weak var favouritedLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            tweetTextLabel.text = tweet?.text
            
            let timestamp = tweet?.createdAt!
            timestampLabel.text = timestamp! as? String
            
            if tweet?.user != nil {
                nameLabel.text = tweet!.user!.name!
                handleLabel.text = (tweet!.user!.Screenname!) 
                var imageUrl: NSURL = NSURL(string: tweet!.user!.profileImageUrl!)!
               // profileImageview.setImageWithURL(, 					placeholderImage: nil)
                profileImageview.setImageWithURL(imageUrl, placeholderImage: nil)
                nameLabel.text = tweet?.user!.name
            }
          
            if tweet?.favourited == true {
                favourited.text = "favorited"
            } else {
                favourited.hidden = true
            }

            if tweet?.retweeted == true {
                reTweeted.text = "retweeted"
            } else {
                reTweeted.hidden = true
            }
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
