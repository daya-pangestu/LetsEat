//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

class ExploreDataManager{
    func fetch() -> [ExploreItem] {
    return loadData().map{ data in
        LetsEat.ExploreItem(dict: data)
        }
    }
    
    private func loadData() -> [[String :String]]{
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource:
                                        "ExplorerData", ofType: "plist"),
           let exploreData = FileManager.default.contents(atPath: path),
           let exploreItems = try? decoder.decode([[String : String]].self, from: exploreData){
            return exploreItems
        }
        return [[:]]
    }
    
    func numberOfExploreItems() -> Int{
        loadData().count
    }
    
    func exploreItem(at index : Int) -> ExploreItem{
        fetch()[index]
    }
}
