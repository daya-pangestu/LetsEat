//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 08/04/22.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let manager = ExploreDataManager()
    var selectedCity : LocationItem?
    var headerView : ExplorerHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initilize()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier ==  Segue.restaurantList.rawValue,
           selectedCity == nil {
            showLocationRequiredAlert()
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.locationList.rawValue:
            showLocationList(segue: segue)
        case Segue.restaurantList.rawValue:
            showRestaurantList(segue: segue)
        default:
            print("segue not added")
        }
    }
    
    
}

// MARK: Private Extension
private extension ExploreViewController{
    func initilize(){
        manager.fetch()
    }
    
    func showLocationRequiredAlert() {
        let alertController = UIAlertController(title: "Location Needed", message: "please select a location", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindlocationCancel(segue: UIStoryboardSegue){
    }
    
    @IBAction func unwindLocationDone(segue: UIStoryboardSegue){
        if let viewController = segue.source as? LocationViewController{
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.locationLabel.text = location.cityAndState
            }
        }
    }
    
    func showLocationList(segue : UIStoryboardSegue){
        guard let navController = segue.destination as?
                UINavigationController, let viewController =
                navController.topViewController as?
                LocationViewController else {
            return
        }
        viewController.selectedCity = selectedCity
    }
    
    func showRestaurantList(segue : UIStoryboardSegue){
        if let viewController = segue.destination as?
            RestaurantListViewController, let city =
            selectedCity, let index =
            collectionView.indexPathsForSelectedItems?.first?
            .row {
            viewController.selectedCuisine =
            manager.exploreItem(at: index).name
            viewController.selectedCity = city
        }
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        headerView = header as? ExplorerHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        manager.numberOfExploreItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let exploreItem = manager.exploreItem(at: indexPath.row)
        cell.ExploreNameLabel.text = exploreItem.name
        cell.ExploreImageView.image = UIImage(named: exploreItem.image ?? "")
        return cell
    }
    
}
