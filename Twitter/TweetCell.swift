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
	@IBOutlet weak var retweetImageView: UIImageView!

	@IBOutlet weak var favouriteImage: UIImageView!
	var tweet: Tweet? {
		didSet {
			tweetTextLabel.text = tweet?.text

			// let timestamp = tweet?.createdAt!
			// timestampLabel.text = tweet?.createdAtString
			// timestamp! as? String

			if tweet?.user != nil {
				nameLabel.text = tweet!.user!.name!
				handleLabel.text = (tweet!.user!.Screenname!)
				let imageUrl: NSURL = NSURL(string: tweet!.user!.profileImageUrl!)!
				// profileImageview.setImageWithURL(, 					placeholderImage: nil)
				profileImageview.setImageWithURL(imageUrl, placeholderImage: nil)
				nameLabel.text = tweet?.user!.name
				favouriteImage.image = UIImage(named: "heartImage")
				retweetImageView.image = UIImage(named: "greyRetweet")
			}

			if tweet?.favouriteCount != nil {
				favourited.text = "\(tweet!.favouriteCount!)"
			} else {
				favourited.hidden = true
			}

			if tweet?.retweetCount != nil {
				reTweeted.text = "\(tweet!.retweetCount!)"
			} else {
				reTweeted.hidden = true
			}

			var tap = UITapGestureRecognizer(target: self, action: Selector("onProfileImageTapped"))
			profileImageview.addGestureRecognizer(tap)
			profileImageview.userInteractionEnabled = true
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code

		profileImageview.layer.cornerRadius = 5
		profileImageview.clipsToBounds = true

		tweetTextLabel.preferredMaxLayoutWidth = tweetTextLabel.frame.size.width
		nameLabel.preferredMaxLayoutWidth = tweetTextLabel.frame.size.width
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		tweetTextLabel.preferredMaxLayoutWidth = tweetTextLabel.frame.size.width
		nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
	}

	func onProfileImageTapped()
	{
		let menu = (HamburgerViewController.globalNavigationController!.menuViewController as! MenuViewController)
		menu.navigateToProfile(tweet!.user!)

		// let storyboard = UIStoryboard(name: "Main", bundle: nil)
		// let profileNavigationController: UIViewController = HamburgerViewController.globalNavigationController. storyboard.instantiateViewControllerWithIdentifier("ProfileNavigationController")
		// HamburgerViewController.globalNavigationController!.contentViewController = profileNavigationController

//        if var topView = (profileNavigationController as? UINavigationController)?.topViewController {
//            if topView.isKindOfClass(ProfileViewController) {
//                (topView as! ProfileViewController).profile = tweet?.user!
//                //let profileViewController: ProfileViewController = (topView as? ProfileViewController)!
		// profileViewController.profile = tweet?.user!

		// topView = ProfileViewController(user: tweet?.user!)
		// (profileNavigationController as? UINavigationController)?.popViewControllerAnimated(false)
		// (profileNavigationController as? UINavigationController)?.pushViewController(topView, animated: false)
		// }
		// }
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}
}
