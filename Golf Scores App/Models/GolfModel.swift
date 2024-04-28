//
//  GolfModel.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import Foundation

struct GolfModel: Codable {
    let id: ID
    let previousTourn: PreviousTourn
    let rankings: [Ranking]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case previousTourn, rankings
    }
}

// MARK: - ID
struct ID: Codable {
    let oid: String

    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}

// MARK: - PreviousTourn
struct PreviousTourn: Codable {
    let name, tournID, endDate: String

    enum CodingKeys: String, CodingKey {
        case name
        case tournID = "tournId"
        case endDate
    }
}

// MARK: - Ranking
struct Ranking: Codable, Identifiable {
    let id = UUID()
    let playerID, lastName, firstName: String
    let rank: Rank
    let previousRank, totalPoints, numWINS, numTop10S: String
    let pointsBehind: String

    enum CodingKeys: String, CodingKey {
        case playerID = "playerId"
        case lastName, firstName, rank, previousRank, totalPoints
        case numWINS = "numWins"
        case numTop10S = "numTop10s"
        case pointsBehind
    }
}

// MARK: - Rank
struct Rank: Codable {
    let numberInt: String

    enum CodingKeys: String, CodingKey {
        case numberInt = "$numberInt"
    }
}


