//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 08/04/22.
//

import UIKit

class ExploreViewController: UIViewController,
                             UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
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
    
    

    @IBOutlet var collectionView: UICollectionView!
    
    let manager = ExploreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetch()

    }
    
    @IBAction func unwindlocationCancel(segue:
                                        UIStoryboardSegue
    ){
        
    }
}
