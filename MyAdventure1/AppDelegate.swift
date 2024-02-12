//
//  AppDelegate.swift
//  MyAdventure1
//
//  Created by Alen Yakovlev on 2/10/24.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create an instance of the Adventure model
        let adventure = Adventure(option1: "Start Adventure", option2: "Second Decision",
                                   outcome1: .success, outcome2: .failure,
                                   nextAdventure1: .nextAdventure(nestedAdventure), nextAdventure2: .nextAdventure(adventure3))
        
        print("Adventure object created: \(adventure)")
        
        // Get a reference to the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the AdventureViewController from the storyboard
        guard let adventureViewController = storyboard.instantiateViewController(withIdentifier: "AdventureViewController") as? AdventureViewController else {
            fatalError("Unable to instantiate AdventureViewController from the storyboard")
        }
        
        // Set the adventure property of the AdventureViewController
        adventureViewController.adventure = adventure
        
        // Set the AdventureViewController as the root view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = adventureViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

