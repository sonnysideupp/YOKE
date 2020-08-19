//
//  ContentView.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showSheetView = false
    @State var showAddPlayerModal = false
    @State var needToUpdate: Bool = false
    @ObservedObject var observed = Observer()
    // If the next line is commented, the button will become not clickable after the presentation.
    @Environment(\.presentationMode) var presentation
    init() {
        
        
        UITabBar.appearance().barTintColor = AppColor.appDarkNavyColor
        self.congfignavBar()
        

        
        
        
    }
    
    // Congfig NavBar appearance
    func congfignavBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColor.appDarkNavyColor
        
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
        ]
        
        appearance.largeTitleTextAttributes = attrs
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        
        
        NavigationView {
            ZStack{
                Color(AppColor.appDarkNavyColor).edgesIgnoringSafeArea(.all)
                VStack{
                    
                    TabView {
                        HomeView(observed: self.observed)
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
                }}
                .navigationBarTitle("YOKE")
                .navigationBarItems(trailing:
//                    Button("+") {
//                        print("HI")
//                         self.showSheetView.toggle()
//                    }.sheet(isPresented: $showSheetView, onDismiss: {
//                        print("Ondismiss")
//                        var Presentation: PresentationMode
//
//                    }
//
//
//                    ) {
//
//                        AddPlayerModalView(dismissedView: self.$showSheetView)
//                    }
                    NavigationLink("+", destination: AddPlayerModalView(dismissedView: self.$needToUpdate, updateObserver: {
                        // call back to update player cards once new one is added 
                        self.observed.getPlayerDataFromFirebase()
                    }))
            )
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







