//
//  Observer.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import Firebase
class Observer : ObservableObject{
    
    @Published var playerLiveModel = [PlayerData]()
    
    @Published var playerNonLiveModel = [PlayerData]()
    
    
    var fetcheddata = false
    var db = Firestore.firestore()
    init() {
        //getPlayerData()
        getPlayerDataFromFirebase()
        print("getPlayer")
        // Created a new player because the data from API don't have any online players 
        //self.playerLiveModel.append(PlayerData(name: "Sonny Huang", bio: "Developer", isOnline: true, iconimage: Image("playerimage")))
    }
    func getPlayerDataFromFirebase(){
        self.playerLiveModel = [PlayerData]()
        self.playerNonLiveModel = [PlayerData]()
        
        db.collection("Stars").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.playerNonLiveModel.append(PlayerData(dictionary: document.data()))
                    
                }
                self.fetcheddata = true
            }
        }
    }
    
   
    
//    func getPlayerData(){
//        let url =  APIURL.getPlay
//        YOKEAPIManager.RequestGetUrl(url, success:{
//            (responseDictionary) in
//            print( responseDictionary)
//            if responseDictionary.count > 0 {
//                for i in 0..<responseDictionary.count{
//                    let jsondic = responseDictionary[i]
//                    //print("isonline")
//                    //print(jsondic["isOnline"] as? Bool)
//                    if let isOnline = jsondic["isOnline"] as? Bool{
//                        if isOnline == true{
//
//                            self.playerLiveModel.append(PlayerData(dictionary: jsondic))
//                        }else if isOnline == false{
//                            self.playerNonLiveModel.append(PlayerData(dictionary: jsondic))
//                        }else{
//                            print("nodata")
//                        }
//
//                    }
//
//
//
//                }
//
//                self.fetcheddata = true
//            }
//
//         })
//    }
    
    
    
    
}
