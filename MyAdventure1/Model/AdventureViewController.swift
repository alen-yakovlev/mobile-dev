//
//  AdventureViewController.swift
//  MyAdventure1
//
//  Created by Alen Yakovlev on 2/06/24.
//

import UIKit

class AdventureViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!

    var adventure: Adventure?

        // Add an initializer to set the adventure property
    required init?(coder aDecoder: NSCoder) {
        // Call the designated initializer of the superclass
        super.init(coder: aDecoder)
        
        // Initialize the adventure property with default values
        self.adventure = Adventure(option1: "Yes", option2: "No",
                                   outcome1: .failure, outcome2: .failure,
                                   nextAdventure1: .none, nextAdventure2: .none)
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            configureView()
        }

    func configureView() {
        guard let adventure = adventure else {
            print("Adventure object is nil")
            return
        }
    

        print("Option 1: \(adventure.option1)")
        print("Option 2: \(adventure.option2)")
        print("Configuring view with adventure: \(adventure)")
        titleLabel.text = "Welcome to the Adventure! Here is the senario: You approach a mysterious door. There are two objects on the ground: a flashlight and a baseball bat. You can only grab ONE, do you take the flashlight?"
        option1Button.setTitle(adventure.option1, for: .normal)
        option2Button.setTitle(adventure.option2, for: .normal)
    }

    @IBAction func optionButtonTapped(_ sender: UIButton) {
        let choice = sender == option1Button ? 1 : 2

        guard let adventure = adventure else {
            return
        }

        print("Choice: \(choice)") // Debugging statement
        let (outcome, nextAdventureStep) = adventure.makeChoice(choice: choice)
        print("Outcome: \(outcome)") // Debugging statement
        handleOutcome(outcome)

        switch nextAdventureStep {
            case .nextAdventure(let nextAdventure):
                navigateToNextAdventure(nextAdventure)
            case .none:
                print("No next adventure")
            }
        }

        func navigateToNextAdventure(_ nextAdventure: Adventure) {
            guard let adventureViewController = storyboard?.instantiateViewController(withIdentifier: "AdventureViewController") as? AdventureViewController else {
                fatalError("Unable to instantiate AdventureViewController from the storyboard")
            }
            
            adventureViewController.adventure = nextAdventure
            navigationController?.pushViewController(adventureViewController, animated: true)
    }

    func handleOutcome(_ outcome: AdventureOutcome) {
        switch outcome {
        case .success:
            titleLabel.text = "Congratulations! You succeeded!"
        case .failure:
            titleLabel.text = "Oops! You failed!"
        }
        option1Button.isHidden = true
        option2Button.isHidden = true
    }
}
