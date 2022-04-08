//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 08/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController,
                                    UICollectionViewDataSource,UICollectionViewDelegate{

    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
    
}
