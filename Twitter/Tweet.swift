//
//  Tweets.swift
//  Twitter
//
//  Created by Kanch on 2/18/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    
    init(dictionary: NSDictionary){
    
        user = dictionary["user"] as? User
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EE MMM d HH:mm:ss Z y"
        
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func TweetsWithArray(array: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in array
        {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    
    }

}
