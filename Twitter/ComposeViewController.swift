//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Kanch on 2/20/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textViewLabel: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //textViewLabel.text =

        // Do any additional setup after loading the view.
    }

    @IBAction func composeTweetOnClick(sender: AnyObject) {
    TwitterClient.sharedInstance.tweet(self.textViewLabel.text, id: "")
        
        //tweet(detailsTextView.text, id: "\(self.tweet.id)")
        
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
