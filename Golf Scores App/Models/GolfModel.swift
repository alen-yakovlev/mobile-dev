//
//  GolfModel.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import Foundation

struct GolfModel: Codable, Identifiable {
    let id: String
    let fullName: String
    let rank: Int
    let events: Int
    let totalPoints: Double
    let pointsGained: Double

}

struct Players: Codable {
    let rankings : [GolfModel]
}

