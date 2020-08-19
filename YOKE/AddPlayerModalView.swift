//
//  ModalView.swift
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

struct AddPlayerModalView: View{
    //var player = PlayerData()
    @Binding var dismissedView: Bool
    @Environment(\.presentationMode) var presentationMode
    @State var Name: String = ""
    @State var Email: String = ""
    @State var Bio: String = ""
    @State var PhoneNumber: String = ""
    // call back to update player cards once new one is added 
    var updateObserver: () -> ()
    var db = Firestore.firestore()
    
    
    var body: some View{
        ZStack{
            
            Color(AppColor.appDarkNavyColor).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
    
                
                Form{
                    Section(header: Text("Star's Info")){
                        TextField("Name", text:$Name)
                        TextField("Email", text:$Email)
                        TextField("Bio", text:$Bio)
                        TextField("PhoneNumber", text:$PhoneNumber)
                        
                    }
                    
                    
                    
                }
                HStack(){
                    Spacer()
                    Button(
                        action: {
                            // Add a new document in collection "cities"
                            var ref: DocumentReference? = nil
                            ref = self.db.collection("Stars").addDocument(data: [
                                "Name": "\(self.Name)",
                                "Email": "\(self.Email)",
                                "Bio" : "\(self.Bio)",
                                "PhoneNumber" : "\(self.PhoneNumber)"
                                
                            ]) { err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    print("Document added with ID: \(ref!.documentID)")
                                    self.dismissedView.toggle()
                                    self.updateObserver()
                                    self.presentationMode.wrappedValue.dismiss()
                                    
                                }
                            }
                            
                            
                            
                            
                            
                    })
                    {Text("Submit").font(AppFont.Helvetica.size_24).foregroundColor(Color.white).bold()}.padding(.leading, 30).padding(.trailing,30).padding(20)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(40)
                    
                    Spacer()
                    
                }
                
            }
        }.navigationBarBackButtonHidden(true).navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismissedView.toggle()
            self.presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "xmark").foregroundColor(.white)
        })
    }
}



