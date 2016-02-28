//
//  MenuViewController.swift
//  Twitter
//
//  Created by Kanch on 2/25/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var menuTableView: UITableView!

	let menuItems = ["Profile", "Timeline", "Mentions", "Logout"]

	private var profileNavigationController: UIViewController!
	private var mentionsNavigationController: UIViewController!
	private var timelineNavigationController: UIViewController!
	private var loginNavigationController: UIViewController!

	var viewControllers: [UIViewController] = []

	var hamburgerViewController: HamburgerViewController!

	override func viewDidLoad() {
		super.viewDidLoad()

		menuTableView.delegate = self
		menuTableView.dataSource = self

		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		profileNavigationController = storyboard.instantiateViewControllerWithIdentifier("ProfileNavigationController")
		viewControllers.append(profileNavigationController)
		timelineNavigationController = storyboard.instantiateViewControllerWithIdentifier("NavigationControllertoTweets")
		viewControllers.append(timelineNavigationController)
		mentionsNavigationController = storyboard.instantiateViewControllerWithIdentifier("mentionsNavigationController")
		viewControllers.append(mentionsNavigationController)
		loginNavigationController = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController")
		viewControllers.append(loginNavigationController)

		// Do any additional setup after loading the view.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print(menuItems.count)
		return 4
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView
			.dequeueReusableCellWithIdentifier("MenuViewCell", forIndexPath: indexPath) as! MenuViewCell
		cell.backgroundColor = UIColor(red: 0 / 255.0, green: 132 / 255.0, blue: 237.0 / 255.0, alpha: 100.0 / 100.0)

		cell.menuItemLabel.text = menuItems[indexPath.row]
		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		var controller = viewControllers[indexPath.row]
        hamburgerViewController.contentViewController = controller
		if var topView = (controller as? UINavigationController)?.topViewController {
			if topView.isKindOfClass(ViewController) {

				User.currentUser?.logout()
			}
            else if topView.isKindOfClass(ProfileViewController){
                (topView as! ProfileViewController).profile = User.currentUser
            }
		}
		
	}
    
    func navigateToProfile(user: User) {
        let viewToShow = profileNavigationController
        hamburgerViewController.contentViewController = viewToShow
        if let topView = (viewToShow as? UINavigationController)?.topViewController {
            if topView.isKindOfClass(ProfileViewController) {
                (topView as! ProfileViewController).profile = user
            }
        }
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
