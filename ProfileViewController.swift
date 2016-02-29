//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Kanch on 2/26/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var tweetsCountLabel: UILabel!
	@IBOutlet weak var followingCountLabel: UILabel!
	@IBOutlet weak var followersCountLabel: UILabel!

	var profile: User! {
		didSet {
            view.layoutIfNeeded() 
			let profileImageUrl: NSURL = NSURL(string: profile!.profileImageUrl!)!
			profileImageView.setImageWithURL(profileImageUrl, placeholderImage: nil)
			tweetsCountLabel.text = "\(profile!.tweetsCount!)"
			followersCountLabel.text = "\(profile!.followersCount!)"
			followingCountLabel.text = "\(profile!.followingCount!)"
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		// let user : User? = User.currentUser

//		if (profile == nil) {
//			profile = User.currentUser
		//}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */
}
