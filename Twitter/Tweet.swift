//
//  Tweets.swift
//  Twitter
//
//  Created by Kanch on 2/18/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

var _tweetsInTimeline : [Tweet]?

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var favourited: Bool?
    var favouriteCount: Int?
    var retweeted: Bool?
    var retweetCount: Int?
    var createdAtString: String?
    var createdAt: NSDate?
    var dictionary: NSDictionary?
    var id: String
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        user = User(dictionary: (dictionary["user"] as? NSDictionary)!)
        text = dictionary["text"] as? String
        favourited = dictionary["favorited"] as? Bool
        favouriteCount = dictionary["favorite_count"] as? Int
        retweeted = dictionary["retweeted"] as? Bool
        retweetCount = dictionary["retweet_count"] as? Int
        createdAtString = dictionary["created_at"] as? String
        id = dictionary["id_str"] as! String
        
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EE MMM d HH:mm:ss Z y"
        
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func TweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in array {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
    
    class var tweetsTimeline: [Tweet]?
    {
        get {
            return _tweetsInTimeline
        }
        set(tweets){
            _tweetsInTimeline = tweets
        }
    }
}