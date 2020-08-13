//
//  PlayerData.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//


import Foundation
import Alamofire

class YOKEAPIManager{
    
    class func RequestGetUrl(_ url: String, success: @escaping (_ responseDictionary: Array<Dictionary<String, AnyObject?>>) -> Void ){
        
        AF.request(url).responseJSON(completionHandler: {
            (response) in
            //print("data")
            //sprint(String(data: response.data!, encoding: String.Encoding.utf8)!)
            switch response.result {
            case let .success(value):
              
                let json = value
                if  (json as? [String : AnyObject]) != nil{
                    if let dictionaryArray = json as? Dictionary<String, AnyObject?> {
                      
                        
                        if let jsonArray = dictionaryArray["stars"] as? Array<Dictionary<String, AnyObject?>>{
                            //print(jsonArray)
                            success(jsonArray)
                        }
                    }
                    
                    }
                    
                    
                
            case let .failure(error):
                print(error)
            }
            
            
            
        })
    }
    
    
    
}


struct APIURL{
    
       static let baseURL = "https://us-central1-yoke-gaming.cloudfunctions.net/"
       
       // hourly data
       static let getPlay = baseURL + "testCall"

}
