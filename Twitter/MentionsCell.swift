//
//  MentionsCell.swift
//  Twitter
//
//  Created by Kanch on 2/19/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import AFNetworking

class MentionsCell: UITableViewCell {
    @IBOutlet weak var mentionsTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var favourited: UILabel!
    @IBOutlet weak var reTweeted: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var profileImageview: UIImageView!
    // @IBOutlet weak var favouritedLabel: UILabel!
    @IBOutlet weak var retweetImageView: UIImageView!
    
    @IBOutlet weak var favouriteImage: UIImageView!
    var mention: Tweet? {
        didSet {
            mentionsTextLabel.text = mention?.text
            
            // let timestamp = tweet?.createdAt!
            // timestampLabel.text = tweet?.createdAtString
            //timestamp! as? String
            
            if mention?.user != nil {
                nameLabel.text = mention!.user!.name!
                handleLabel.text = (mention!.user!.Screenname!)
                let imageUrl: NSURL = NSURL(string: mention!.user!.profileImageUrl!)!
                // profileImageview.setImageWithURL(, 					placeholderImage: nil)
                profileImageview.setImageWithURL(imageUrl, placeholderImage: nil)
                nameLabel.text = mention?.user!.name
//                favouriteImage.image = UIImage(named: "heartImage")
//                retweetImageView.image = UIImage(named: "greyRetweet")
//                
                
            }
            
            if mention?.favouriteCount != nil {
                favourited.text = "\(mention!.favouriteCount!)"
            } else {
                favourited.hidden = true
            }
            
            if mention?.retweetCount != nil {
                reTweeted.text = "\(mention!.retweetCount!)"
            } else {
                reTweeted.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageview.layer.cornerRadius = 5
        profileImageview.clipsToBounds = true
        
        mentionsTextLabel.preferredMaxLayoutWidth = mentionsTextLabel.frame.size.width
        nameLabel.preferredMaxLayoutWidth = mentionsTextLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mentionsTextLabel.preferredMaxLayoutWidth = mentionsTextLabel.frame.size.width
        nameLabel.preferredMaxLayoutWidth   = nameLabel.frame.size.width
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
