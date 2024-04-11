//
//  MainView.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentation
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("User is Logged In!")
                .font(.title.bold())
            
            Spacer()
                            
            // Log out button
            Button {
               let firebaseAuth = Auth.auth()
               do {
                   try firebaseAuth.signOut()
                   
                   //bring user back to login page
                   presentation.wrappedValue.dismiss()
                   
                 } catch let signOutError as NSError {
                   print("Error signing out: %@", signOutError)
                }
            } label: {
                Text("Log Out")
                    .frame(maxWidth: .infinity)
                    .font(.title2)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(16)
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
