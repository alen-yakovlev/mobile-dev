//
//  ResetPasswordView.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import SwiftUI
import FirebaseAuth

struct ResetPasswordView: View {
    
    //MARK: - Proprties
    
    @Environment(\.presentationMode) var presentation
    
    @State var email: String = ""
    
    //MARK: - Body
    
    
    
    var body: some View {
            ZStack {
                
                //Background Color
                Color.white
                    .ignoresSafeArea(edges: .all)
                // Main View
                VStack {
                    
                    // fields
                    VStack(spacing: 20) {
                        TextField("Email", text: $email, prompt: Text("Enter email...."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                            .autocapitalization(.none)
                        
                    }
                    .padding()
                    .padding(.bottom, 8.0)
                    
                    // buttons
                    VStack(spacing: 16) {
                        
                        // Create new account button
                        Button{
                            resetPassword()
                            
                        } label: {
                            Text("Reset Password")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(16)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            }
            //title
            .navigationTitle("Reset Password")
        }
    
    //MARK: - helpers
    
    private func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let err = error {
                print("Error: \(err.localizedDescription)")
                return
            }
            
            print("Reset Password")
            
            //bring user back to login page
            presentation.wrappedValue.dismiss()
        }
    }
    
    
    }
    #Preview {
        ResetPasswordView()
    }
    

