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
    public var isOnline : Bool?
    public var iconimage: Image?
    

    
    required public init (dictionary: Dictionary<String, AnyObject?>){
        
       
        name = dictionary["name"] as? String
        print("name")
        print(name)
        bio = dictionary["bio"] as? String
        print("bio")
        print(bio)
        isOnline = dictionary["isOnline"] as? Bool
//        print("isOnline")
//        print(isOnline)
        iconimage = Image("playerimage")
    
    }
    
    required public init(name : String, bio: String, isOnline: Bool, iconimage: Image){
        self.name = name
        self.bio = bio
        self.isOnline = isOnline
        self.iconimage = iconimage
        
    }
    
    
    
}
