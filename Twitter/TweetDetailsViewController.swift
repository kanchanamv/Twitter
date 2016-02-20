//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Kanch on 2/20/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var detailsHandleLabel: UILabel!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var detailsRetweetButton: UIButton!
    @IBOutlet weak var detailsReplyButton: UIButton!
    @IBOutlet weak var detailsFavouriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

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
