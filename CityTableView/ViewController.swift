//
//  ViewController.swift
//  CityTableView
//
//  Created by Alen Yakovlev on 2/25/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cellTableView: UITableView!
    
    
    var cities = [
        CityState("Auburn", "AL"),
        CityState("Atlanta", "GA"),
        CityState("Chicago", "IL"),
        CityState("New York", "NY"),
        CityState("Los Angeles", "CA"),
        CityState("Austin", "TX"),
        CityState("Tucson", "AZ"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            print("Deleted" + self.cities[indexPath.row].city)
            self.cities.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            // Instantiate your NavigationViewController from storyboard
//            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Assuming your storyboard name is "Main"
//            guard let navigationVC = storyboard.instantiateViewController(withIdentifier: "NavigationViewControllerIdentifier") as? SecondViewController else {
//                return
//            }
//
//            // Push the NavigationViewController when a cell is selected
//            navigationController?.pushViewController(navigationVC, animated: true)
//        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToNext", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToNext")
        {
            let indexPath = self.cellTableView.indexPathForSelectedRow!
            
            let secondViewController = segue.destination as? SecondViewController
            
            let selectedCity = cities[indexPath.row]
            
            secondViewController!.selectedCity = selectedCity
            
            self.cellTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

