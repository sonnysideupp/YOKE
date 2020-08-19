//
//  ContentView.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var observed : Observer
    
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false){
            
            if !observed.fetcheddata{
                
                Text("Loading...").frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight:  .infinity)
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                
                
            }else{
                
                VStack(alignment: .leading,spacing: 8){
                    
                    Text("LIVE NOW").font(AppFont.Helvetica.size_28).bold().padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 0))
                    // horitzontal scrollview for online player cards
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            
                            ForEach(observed.playerLiveModel ){
                                playerlivedata in
                                PlayerCardView(player: playerlivedata)
                            }
                            
                        }.frame(height: 350)
                    }
                    
                    Text("FEATURED").font(AppFont.Helvetica.size_28).bold().padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 0))
                    
                    // horitzontal scrollview for offline player cards
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            ForEach(observed.playerNonLiveModel){
                                playerlivedata in
                                PlayerCardView(player: playerlivedata)
                                
                            }
                            
                        }.frame(height: 350)
                        
                    }
                    
                }
            }
            
            
            
            
        }
        
        
        
        
    }
}


//VStack(spacing: 12){

//           Text("Featured")
//           ScrollView{
//               HStack(spacing: 20){
//
//               ForEach(observed.playerNonLiveModel ){
//                   playerlivedata in
//               Text(playerlivedata.name ?? "")
//
//               }
//
//                          }
//                      }
//       }
