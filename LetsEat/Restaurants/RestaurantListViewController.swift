//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 08/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate{

    
    var selectedRestaurant : RestaurantItem?
    var selectedCity : LocationItem?
    var selectedCuisine : String?
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let city = selectedCity?.city, let cuisine =
                selectedCuisine else {
            return
        }
        let manager = RestaurantDataManager()
        manager.fetch(location: city, selectedCuisine: cuisine){ restaurantItems in
            if !restaurantItems.isEmpty {
                restaurantItems.forEach {
                    if let restaurantName = $0.name {
                        print(restaurantName)
                    }
                }
            }else{
                print("no data")
            }
        }
    }
}

//MARK: Private Extension
private extension RestaurantListViewController {
    
}

//MARK UICollectionViewDataSoource
extension RestaurantListViewController:
    UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
}
