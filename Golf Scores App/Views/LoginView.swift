//
//  ContentView.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/9/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    //MARK: - Properties
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showNewAccountView: Bool = false
    @State private var showResetPasswordView: Bool = false
    @State private var showMainView: Bool = false
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                // Links to other views
                NavigationLink(destination: NewAccountView(), isActive: $showNewAccountView, label: { EmptyView() })
                
                NavigationLink(destination: ResetPasswordView(), isActive: $showResetPasswordView, label: { EmptyView() })
                
                NavigationLink(destination: MainView(), isActive: $showMainView, label: { EmptyView() })
                
                // Background Color
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                // Main View
                VStack {
                    // Logo
                    Image("golflogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 24.0)
                    
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
                    }
                    .padding()
                    .padding(.bottom, 8.0)
                    
                    // Buttons
                    VStack(spacing: 16) {
                        // Sign in button
                        Button(action: signInUser) {
                            Text("Sign In")
                                .frame(maxWidth: .infinity)
                                .font(.title2.bold())
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(16)
                        
                        // Create new account button
                        Button(action: { self.showNewAccountView = true }) {
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
                    
                    Button(action: { self.showResetPasswordView = true }) {
                        Text("Forgot Password")
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    .padding()
                }
            }
            // Title
            .navigationTitle("Login Page")
        }
    }
    
    //MARK: - Helpers
    
    private func signInUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                // Handle successful sign-in
                self.showMainView = true
            }
        }
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
