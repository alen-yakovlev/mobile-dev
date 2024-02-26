//
//  SecondViewController.swift
//  CityTableView
//
//  Created by Alen Yakovlev on 2/25/24.
//

import UIKit

class SecondViewController: UIViewController {

   
    
    
    @IBOutlet weak var detail: UILabel!
    
    var selectedCity: CityState!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detail.text = selectedCity.city
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
