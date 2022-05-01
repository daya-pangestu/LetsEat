//
//  ExploreItem.swift
//  LetsEat
//
//  Created by Daya Pangestu on 01/05/22.
//

import Foundation

struct ExploreItem {
    let name : String?
    let image : String?
}

extension ExploreItem {
    init(dict : [String : String]){
        self.name = dict["name"]
        self.image =  dict["image"]
    }
    
    init(name : String, image : String){
        self.name = name
        self.image = image
    }

}
