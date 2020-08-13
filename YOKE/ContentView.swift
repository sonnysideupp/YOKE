//
//  ContentView.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        UITabBar.appearance().barTintColor = AppColor.appDarkNavyColor
    }
    var body: some View {
        ZStack{
            Color(AppColor.appDarkNavyColor).edgesIgnoringSafeArea(.all)
        VStack{
            HStack{
                Image("YOKEIcon").resizable()
                    .frame(width: 96.0, height: 32.0).padding(.leading,16)
                Spacer()
                
            }.background(Color(AppColor.appDarkNavyColor))
         TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Home")
                }
                Text("Discover Screen")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Discover")
                }
            Text("Challenges Screen")
                               .tabItem {
                                   Image(systemName: "bolt")
                                   Text("Challenges")
                           }
                Text("Profile Screen")
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                }
         }
            }
            
            
        }
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
