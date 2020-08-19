//
//  PlayerData.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation
import SwiftUI

public class PlayerData: Identifiable{
    
    public var name : String?
    public var bio : String?
    public var email : String?
    public var phoneNumber : String?
    //public var isOnline : Bool?
    public var iconimage: Image?
    

    
    required public init (dictionary: [String: Any]){
        
       
        name = dictionary["Name"] as? String
        print("name")
        print(name)
        bio = dictionary["Bio"] as? String
        print("bio")
        print(bio)
        //isOnline = dictionary["isOnline"] as? Bool
//        print("isOnline")
//        print(isOnline)
        email = dictionary["Email"] as? String
        phoneNumber = dictionary["PhoneNumber"] as? String
        iconimage = Image("playerimage")
    
    }
    
    required public init(name : String, bio: String, email:String, phoneNumber: String, iconimage: Image){
        self.name = name
        self.bio = bio
        self.email = email
        self.phoneNumber = phoneNumber
        self.iconimage = iconimage
        
    }
    
    
    
}
