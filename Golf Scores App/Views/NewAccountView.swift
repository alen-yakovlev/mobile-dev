//
//  NewAccountView.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct NewAccountView: View {
    
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentation
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordSecond: String = ""
    
    var body: some View {
        ZStack {
            // Background Color
            Color.white
                .ignoresSafeArea(edges: .all)
            
            // Main View
            VStack {
                // Fields
                VStack(spacing: 20) {
                    TextField("Email", text: $email, prompt: Text("Enter email...."))
                        .font(.title2)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password, prompt: Text("Enter Password..."))
                        .font(.title2)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $passwordSecond, prompt: Text("Enter Password again..."))
                        .font(.title2)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                }
                .padding()
                .padding(.bottom, 8.0)
                
                // Buttons
                VStack(spacing: 16) {
                    // Create new account button
                    Button(action: createNewUser) {
                        Text("Create New Account")
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(16)
                }
                .padding()
                
                Spacer()
            }
        }
        // Title
        .navigationTitle("Create New Account")
    }
    
    //MARK: - Helpers
    
    private func createNewUser() {
        
        //check both paxsswords match
        if password != passwordSecond {
            return
        }
        
        if password.isEmpty
        {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print("Error: \(err.localizedDescription)")
                return
            }
            
            // user registered
            print("Successfully registered user")
            
            //bring user back to login page
            presentation.wrappedValue.dismiss()
        }
    }
}

// Preview
struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
