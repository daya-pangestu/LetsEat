//
//  RestaurantItem.swift
//  LetsEat
//
//  Created by Daya Pangestu on 02/05/22.
//

import UIKit
import MapKit
class RestaurantItem: NSObject, MKAnnotation {
    let name : String?
    let cuisines : [String]
    let lat : Double?
    let long : Double?
    let address : String?
    let postalCode : String?
    let state : String?
    let imageUrl : String?
    let restaurantID : Int?
    
    
    init(dict : [String : AnyObject]) {
        self.long = dict["long"] as? Double
        self.name = dict["name"] as? String
        self.cuisines = dict["cuisines"] as? [String] ?? []
        self.address = dict["address"] as? String
        self.postalCode = dict["postalCode"] as? String
        self.state = dict["state"] as? String
        self.imageUrl = dict["image_url"] as? String
        self.restaurantID = dict["id"] as? Int
        self.lat = dict["lat"] as? Double
    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let lat  = lat,let long = long else {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var title: String?{
        name
    }
    
    var subtitle: String?{
        if cuisines.isEmpty {
            return ""
        } else if cuisines.count == 1 {
            return cuisines.first
        } else {
            return cuisines.joined(separator: ", ")
        }
    }

}
