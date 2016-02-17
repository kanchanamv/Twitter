//
//  TwitterClient.swift
//  Twitter
//
//  Created by Kanch on 2/16/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "4DSL1Q427OE80GDZrZb8wX1tD"
let twitterConsumerSecret = "y3aYrCxRkI1yfVXtNKQoSmFFRxeoLWQAouEg6OxrkEi5Ax7iSJ"
let twitterBaseUrl = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1SessionManager {
    
   
    class var sharedInstance: TwitterClient {
            struct Static {
               static let instance = TwitterClient(baseURL: twitterBaseUrl, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
    
                }
                return Static.instance
    
            }
    
}
