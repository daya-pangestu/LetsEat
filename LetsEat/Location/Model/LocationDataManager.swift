//
//  LocationManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

class LocationDataManager{
    private var locations : [LocationItem] = []
    
    private func loadData() -> [[String : String]] {
        let decodder = PropertyListDecoder()
        if let path  = Bundle.main.path(forResource: "Locations", ofType: "plist"),
           let locationData = FileManager.default.contents(atPath: path),
           let locations = try? decodder.decode([[String :String]].self, from: locationData) {
            return locations
        }
        return [[:]]
    }
    
    func fetch(){
        locations.append(contentsOf: loadData().map{ data in
            return LocationItem(dict: data)
        })
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index :Int) -> LocationItem {
        locations[index]
    }
}
