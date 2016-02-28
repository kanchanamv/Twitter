//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Kanch on 2/26/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	weak var navigationDelegate: AnyObject?

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var tweetsCountLabel: UILabel!
	@IBOutlet weak var followingCountLabel: UILabel!
	@IBOutlet weak var followersCountLabel: UILabel!

//    var user: User! {
//        didSet {
//            if (user != nil){
//                if (user!.profileImageUrl != nil)
//            {
//               //                self.title = user!.name
//                print("in userprofile")
//            }
//            }
//            else {print("on the else block")}
//        }
//    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        let user : User? = User.currentUser
        
        if(user != nil){
            let profileImageUrl: NSURL = NSURL(string: user!.profileImageUrl!)!
            profileImageView.setImageWithURL(profileImageUrl, placeholderImage: nil)
            tweetsCountLabel.text = "\(user!.tweetsCount!)"
            followersCountLabel.text = "\(user!.followersCount!)"
            followingCountLabel.text = "\(user!.followingCount!)"
        }

		

		// Do any additional setup after loading the view.
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
