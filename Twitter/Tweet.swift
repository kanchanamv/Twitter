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
    var favourite: Bool?
    var createdAtString: String?
    var createdAt: NSDate?
   var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary){
      self.dictionary = dictionary
        user = dictionary["user"] as? User
        text = dictionary["text"] as? String
        //favourite = dictionary["favorited"] as? Bool
        
        createdAtString = dictionary["created_at"] as? String
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EE MMM d HH:mm:ss Z y"
        
        createdAt = formatter.dateFromString(createdAtString!)
        
    }
    
    class func TweetsWithArray(array: [NSDictionary]) -> [Tweet] {
       var tweets = [Tweet]()
      //  if array != nil {
       // var tweets = [Tweet]()
        for dictionary in array {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
        
    }
    
    
    
//    
//    class func businesses(array array: [NSDictionary]) -> [Business] {
//        var businesses = [Business]()
//        for dictionary in array {
//            let business = Business(dictionary: dictionary)
//            businesses.append(business)
//        }
//        return businesses
//    }
//    

    
//    let categoriesArray = dictionary["categories"] as? [[String]]
//    if categoriesArray != nil {
//    var categoryNames = [String]()
//    for category in categoriesArray! {
//    let categoryName = category[0]
//    categoryNames.append(categoryName)
//    }
//    categories = categoryNames.joinWithSeparator(", ")
//    } else {
//    categories = nil
//    }

    
//    class func TweetsWithArray(array: [NSDictionary]) -> [Tweet]{
//        var tweets = [Tweet]()
//        
//        for dictionary in array
//        {
//            tweets.append(Tweet(dictionary: dictionary))
//        }
//        
//        return tweets
//    
//    }
    
//    var favourited: Bool?
//        {
//        if let favourite = dictionary?["favorited"] as? Bool
//        {
//            return favourite
//            }
//        return false
//    }
//    
//    var reTweeted: Bool?
//        {
//            if let reTweet = dictionary?["retweeted"] as? Bool
//            {
//                return reTweet
//            }
//            return false
//    }
    
    
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