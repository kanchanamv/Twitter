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

	var loginCompletion : ((user: User?, error: NSError?) -> ())?

	class var sharedInstance: TwitterClient {
		struct Static {
			static let instance = TwitterClient(baseURL: twitterBaseUrl, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
		}
		return Static.instance
	}

	func onLoginWithCompletion(completion: (user: User?, error: NSError?) -> ())
	{
		loginCompletion = completion
		// Fetch request Token & Redirect to Auth Page
		TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
		TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "zailoo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
			print("got access to request")

			let authUrl = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")

			UIApplication.sharedApplication().openURL(authUrl!)
		}) { (error: NSError!) -> Void in
			self.loginCompletion!(user: nil, error: error)
		}
	}

	func homeTimelineWithCompletion(params: NSDictionary?, completion: (tweets: [Tweet]?, error: NSError?) -> ())
	{
		GET("1.1/statuses/home_timeline.json",
			parameters: params,
			success: { (operation: NSURLSessionDataTask?, response: AnyObject?) -> Void in
				print("success!")
				let tweets = Tweet.TweetsWithArray(response as! [NSDictionary])
				Tweet.tweetsTimeline = tweets
				print(Tweet.tweetsTimeline)
				completion(tweets: tweets, error: nil)
		},
        failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
				print("fail")
				completion(tweets: nil, error: error)
		})
	}

	func retweet(id: Int64, completion: (retweeted: Bool) -> ()) -> Void {
		POST("1.1/statuses/retweet/\(id).json", parameters: nil,
			success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
                completion(retweeted: true)
			},
			failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
                completion(retweeted: false)
		})
	}

    func favorite(id: Int64, completion: (favorited: Bool) -> ()) -> Void {
		POST("1.1/favorites/create.json?id=\(id)", parameters: nil,
			success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
                completion(favorited: true)
			},
			failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
                completion(favorited: false)
		})
	}

	func reply(text: String, id: String) {
		POST("1.1/statuses/update.json",
			parameters: [
				"status": text,
				"in_reply_to_status_id": id
			],
			success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
			},
			failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
			}
		)
	}

	func tweet(text: String, id: String?) {
        var params: [String : AnyObject] = ["status": text]
        
        if (id != nil && id != "") {
            params["in_reply_to_status_id"] = id
		}

		POST("1.1/statuses/update.json",
			parameters: params,
			success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
//                if(id == nil) {
//                    params["user"] = User.currentUser
//                    
//                    let myTweet: Tweet = Tweet(dictionary: params)
//                    Tweet.
                //}
			},
			failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
			}
		)
	}
    
    func mentions(params: NSDictionary?, completion: (mentions: [Tweet]?, error: NSError?) -> ())
    {
        GET("1.1/statuses/mentions_timeline.json",
            parameters: params,
            success: { (operation: NSURLSessionDataTask?, response: AnyObject?) -> Void in
               // print("success!")
                let mentions = Tweet.MentionsWithArray(response as! [NSDictionary])
                Tweet.mentionsTimeline = mentions
               // print("inside mentions")
               // print(Tweet.mentionsTimeline)
                completion(mentions: mentions, error: nil)
            },
            failure: { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
                print("fail")
                completion(mentions: nil, error: error)
        })
    }
    


	func openURL(url: NSURL) {
		TwitterClient.sharedInstance.fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential(queryString: url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
			print("Got access token")
			TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
			TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
				// print("user: \(response)")
				let user = User(dictionary: response as! NSDictionary)
				User.currentUser = user
				print(user)
				self.loginCompletion?(user: user, error: nil)
				print("user: \(user.name)")
			}) { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
				print("somethingelse")
			}

			// TwitterClient.sharedInstance.GET( "1.1/statues/home_timeline.json", parameters: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
			// print("user: \(response)")
			//
			//
			// }) { (operation: NSURLSessionDataTask?, error: NSError?) -> Void in
			// print("inside error timeline")
			//
			// }
		}) { (error: NSError!) -> Void in
			print("Didnt get access token")
			self.loginCompletion!(user: nil, error: error)
		}
	}
}
