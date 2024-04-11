//
//  AdventureModel.swift
//  MyAdventure1
//
//  Created by Alen Yakovlev on 2/06/24.
//

import Foundation


enum AdventureOutcome {
    case success
    case failure
}

indirect enum AdventureNextStep {
    case nextAdventure(Adventure)
    case none
}

struct Adventure {
    let option1: String
    let option2: String
    let outcome1: AdventureOutcome
    let outcome2: AdventureOutcome
    let nextAdventure1: AdventureNextStep
    let nextAdventure2: AdventureNextStep
    
    init(option1: String, option2: String, outcome1: AdventureOutcome, outcome2: AdventureOutcome, nextAdventure1: AdventureNextStep, nextAdventure2: AdventureNextStep) {
        self.option1 = option1
        self.option2 = option2
        self.outcome1 = outcome1
        self.outcome2 = outcome2
        self.nextAdventure1 = nextAdventure1
        self.nextAdventure2 = nextAdventure2
    }
    
    func makeChoice(choice: Int) -> (outcome: AdventureOutcome, nextAdventure: AdventureNextStep) {
        switch choice {
        case 1:
            return (outcome1, nextAdventure1)
        case 2:
            return (outcome2, nextAdventure2)
        default:
            return (.failure, .none)
        }
    }
}

// Example adventures
let adventure1 = Adventure(option1: "Option 1.1", option2: "Option 1.2", outcome1: .success, outcome2: .failure, nextAdventure1: .none, nextAdventure2: .none)
let adventure2 = Adventure(option1: "Option 2.1", option2: "Option 2.2", outcome1: .success, outcome2: .failure, nextAdventure1: .none, nextAdventure2: .none)
let adventure3 = Adventure(option1: "Option 3.1", option2: "Option 3.2", outcome1: .success, outcome2: .failure, nextAdventure1: .none, nextAdventure2: .none)
let adventure4 = Adventure(option1: "Option 4.1", option2: "Option 4.2", outcome1: .success, outcome2: .failure, nextAdventure1: .none, nextAdventure2: .none)

// Nesting adventures
let nestedAdventure = Adventure(option1: "First Decision", option2: "Second Decision", outcome1: .success, outcome2: .failure,
                                 nextAdventure1: .nextAdventure(adventure1), nextAdventure2: .nextAdventure(adventure2))

let adventure = Adventure(option1: "Start Adventure", option2: "Second Decision", outcome1: .success, outcome2: .failure,
                          nextAdventure1: .nextAdventure(nestedAdventure), nextAdventure2: .nextAdventure(adventure3))
