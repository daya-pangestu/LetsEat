//
//  LocationManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

class LocationDataManager{
    private var locations : [String] = []
    
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
            var result = ""
            if let city = data["city"], let state = data["state"] {
                result = "\(city), \(state)"
            }
            return result
        })
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index :Int) ->String {
        locations[index]
    }
}
