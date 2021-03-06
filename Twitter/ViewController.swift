//
//  ViewController.swift
//  Twitter
//
//  Created by Kanch on 2/17/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import BDBOAuth1Manager



class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if User.currentUser != nil
        {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        
        TwitterClient.sharedInstance.onLoginWithCompletion()
            {   (user: User?, error: NSError?) in
                if user != nil
                {
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                }
                else
                {
                    //show login failed
                }
                
        }
        
       
}
}