//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

class ExploreDataManager : DataManager {
    private var exploreItems : [ExploreItem] = []
    
    
    func fetch() {
        loadPlist(file: "ExplorerData").forEach{ data in
            let exploreItem = LetsEat.ExploreItem(dict: data as! [String : String])
            exploreItems.append(exploreItem)
        }
    }

    func numberOfExploreItems() -> Int{
        exploreItems.count
    }
    
    func exploreItem(at index : Int) -> ExploreItem{
        exploreItems[index]
    }
}
