//
//  ModalView.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation
import SwiftUI


struct PlayerModalView: View{
    var player: PlayerData
    @Binding var showSheetView: Bool
    @State var refresh: Bool = false
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(player:PlayerData, showSheetView: Binding<Bool> ) {
        self._showSheetView = showSheetView
        self.player = player
        print("init")
        print(player.name)
        
    }
    
    var body: some View{
        ZStack{
            
            Color(AppColor.appDarkNavyColor).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                HStack(){
                    Button(
                        action: {
                            print("dismissed")
                            self.showSheetView = false
                            self.refresh = true
                            print(self.showSheetView)
                            //self.presentationMode.wrappedValue.dismiss()
                            
                    }
                    ){Image(systemName: "xmark").foregroundColor(.white)}
                    
                    Spacer()
                    Text(player.name ?? "").font(AppFont.Helvetica.size_24).foregroundColor(Color.white).bold().padding(.trailing, 20)
                    Spacer()
                    
                }.padding(20).padding(.top, 20)
                
                Spacer()
                HStack(){
                    
                    Spacer()
                    Button(
                        action: {
                            
                    })
                    {Text("Join Now").font(AppFont.Helvetica.size_24).foregroundColor(Color.white).bold()}.padding(.leading, 30).padding(.trailing,30).padding(20)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(40)
                    
                    Spacer()
                    
                    
                    
                }.padding(.bottom, 100)
                
                
            }.frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight:  .infinity, alignment: .top).background(player.iconimage?.resizable()
                .scaledToFill())
        }
    }
}



