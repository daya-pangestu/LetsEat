//
//  RestaurantDataManager.swift
//  LetsEat
//
//  Created by Daya Pangestu on 05/05/22.
//

import Foundation
class RestaurantDataManager {
    private var restaurantItems : [RestaurantItem] = []
    
    func fetch(location :String,
               selectedCuisine: String = "All",
               completionHandler: (_ restaurantItems: [RestaurantItem])
               ->Void) {
        if let file = Bundle.main.url(forResource: location, withExtension: "json"){
            do {
                let data = try Data(contentsOf: file)
                let restaurants = try JSONDecoder().decode([RestaurantItem].self, from: data)
                if selectedCuisine != "All" {
                    restaurantItems = restaurants.filter{
                        ($0.cuisines.contains(selectedCuisine))
                    }
                }else {
                    restaurantItems = restaurants
                }
            }catch {
                print("there was an error \(error)")
            }
        }
        completionHandler(restaurantItems)
    }
    
    func numberOfRestaurantItems() -> Int { restaurantItems.count}
    
    func restaurantItems(_ index : Int) ->
    RestaurantItem {
        restaurantItems[index]
    }
    
    
}
