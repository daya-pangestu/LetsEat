//
//  MapDataManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 02/05/22.
//

import Foundation

class MapDatamanager : DataManager {
    private var items : [RestaurantItem] = []
    var annotations : [RestaurantItem] {
        items
    }
    
    func fetch(completion : (_ annotaions : [RestaurantItem]) -> ()){
        if !items.isEmpty {
            items.removeAll()
        }
        
    
        loadPlist(file: "MapLocations").forEach{
            items.append(RestaurantItem(dict: $0))
        }
        completion(items)
    }
}
