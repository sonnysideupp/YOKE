//
//  PlayerCardView.swift
//  YOKE
//
//  Created by Sonny Huang on 8/13/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct PlayerCardView: View {
    var player: PlayerData
    @State private var show_modal: Bool = false
    
    init(player:PlayerData ) {
        self.player = player
        print("init")
        print(player.name)

     }
    var body: some View {
   
        Text(player.name ?? "").font(AppFont.Helvetica.size_18).foregroundColor(Color.white).bold() .frame(width: 200, height: 350,alignment: .top)
            .background(player.iconimage?.resizable()
            .scaledToFill()).cornerRadius(15).padding(8).onTapGesture(){
                print("tapped")
                self.show_modal = true
        }.sheet(isPresented: self.$show_modal){
            ModalView(player:self.player)
        }
    }
}

struct PlayerCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardView(player:PlayerData(name: "Sonny", bio: "Developer", isOnline: false, iconimage: Image("playerimage")))
    }
}
