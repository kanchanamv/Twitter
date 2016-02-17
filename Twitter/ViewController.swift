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

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "zailoo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print ("got access to request")
            
            var authUrl = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            
            UIApplication.sharedApplication().openURL(authUrl!)
            }) { (error: NSError!) -> Void in
            print ("inside Error block")
    }

}
}