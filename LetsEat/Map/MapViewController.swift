//
//  MapViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 02/05/22.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    private let manager = MapDatamanager()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize(){
        manager.fetch{ annotations in setupMap(annotations) }
    }
    
    func setupMap(_ annotations: [RestaurantItem]) {
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5),animated: true)
        mapView.addAnnotations(manager.annotations)
        
    }
    
    

}
