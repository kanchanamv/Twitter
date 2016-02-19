//
//  Users.swift
//  Twitter
//
//  Created by Kanch on 2/18/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

var _currentUser: User?
var currentUserKey = "kCurrentUserKey"

class User: NSObject {

    var name:String?
    var Screenname:String?
    var profileImageUrl:String?
    var tagline: String?
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        Screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profle_image_url"] as? String
        tagline = dictionary["description"] as? String

        
    }
    
    class var currentUser: User?
        {
        get {
        
        if _currentUser == nil
        {
        var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
        if data != nil
        {  do {
        let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
        _currentUser = User(dictionary: dictionary)
    } catch {
        print("Cannot Retrieve Current Logged in User error")
        }
        
        return _currentUser
        }
      //  var dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: 0)
        }
        
        return _currentUser
        }
        set(user){
        _currentUser = user
        
        if _currentUser != nil
        {
           // var data = NSJSONSerialization.dataWithJSONObject(obj: user!.dictionary, options: 0)
            do {
                let data = try NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: []) as NSData
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
            } catch {
                print("JSON error")
            }
       // var data = NSJSONSerialization.dataWithJSONObject(<#T##obj: AnyObject##AnyObject#>, options: <#T##NSJSONWritingOptions#>)
     //   NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
        
        }
        else
        {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
        }
        NSUserDefaults.standardUserDefaults().synchronize()
        
        }
        
    }
    
}
