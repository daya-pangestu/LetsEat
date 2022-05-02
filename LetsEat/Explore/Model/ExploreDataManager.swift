//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

class ExploreDataManager : DataManager {
    func fetch() -> [ExploreItem] {
    return loadPlist(file: "ExplorerData").map{ data in
        LetsEat.ExploreItem(dict: data as! [String : String])
        }
    }

    func numberOfExploreItems() -> Int{
        loadPlist(file: "ExplorerData").count
    }
    
    func exploreItem(at index : Int) -> ExploreItem{
        fetch()[index]
    }
}
