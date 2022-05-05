//
//  RestaurantDetalTableViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 05/05/22.
//

import UIKit

class RestaurantDetailTableViewController: UITableViewController {

    var selectedRestaurant : RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
    }
    
 


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
