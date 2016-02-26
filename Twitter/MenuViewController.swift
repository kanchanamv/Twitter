//
//  MenuViewController.swift
//  Twitter
//
//  Created by Kanch on 2/25/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var menuTableView: UITableView!
     
    
    
        let menuItems = ["Profile","Timeline","Mentions","Logout"]
    
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
        viewControllers.append (timelineNavigationController)
        mentionsNavigationController = storyboard.instantiateViewControllerWithIdentifier("mentionsNavigationController")
         viewControllers.append(mentionsNavigationController)
       //        loginNavigationController = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController")
//        viewControllers.append(loginNavigationController)
//        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (menuItems.count)
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCellWithIdentifier("MenuViewCell", forIndexPath: indexPath) as! MenuViewCell
        
        
        cell.menuItemLabel.text = menuItems[indexPath.row]
        print(cell.menuItemLabel.text)
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
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
