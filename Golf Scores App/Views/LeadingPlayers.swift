//
//  LeadingPlayers.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import SwiftUI

struct LeadingPlayers: View {
    var lead : Ranking
//    @ObservedObject var viewModel = GolfViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text("Rank: \(lead.rank.numberInt)")
                Text("Last Name: \(lead.lastName)")
                Text("First Name: \(lead.firstName)")
                Text("Total Points: \(lead.totalPoints)")
                Text("Points Behind: \(lead.pointsBehind)")
                Text("Number of wins: \(lead.numWINS)")
                Text("Number of top 10 finishes: \(lead.numTop10S)")
            }
        }
    }
}

