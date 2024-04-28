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
    
    @ObservedObject var golfsvm = GolfViewModel()
    @State private var dataLoaded = false
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            if dataLoaded {
                List(golfsvm.rankData) { lead in
                    NavigationLink(destination: LeadingPlayers(lead: lead)) {
                        Text(lead.firstName + " " + lead.lastName)
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("PGA Tour Leaderboard")
            } else {
                ProgressView()
                    .onAppear {
                        golfsvm.fetchData { success in
                            DispatchQueue.main.async {
                                dataLoaded = success
                            }
                        }
                    }
            }
                
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
