//
//  MapViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 02/05/22.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    private let manager = MapDatamanager()
    var selectedRestaurant : RestaurantItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: Private Extension
private extension MapViewController {
    func initialize(){
        mapView.delegate = self
        manager.fetch{ annotations in setupMap(annotations) }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue)
        default:
            print("Seque not added")
        }
    }
    
    func showRestaurantDetail(_ segue : UIStoryboardSegue){
        if let viewController = segue.destination as? RestaurantDetailTableViewController, let restaurant =
            selectedRestaurant {
            viewController.selectedRestaurant = restaurant
        }
    }}

// MARK: MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func setupMap(_ annotations: [RestaurantItem]) {
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5),animated: true)
        mapView.addAnnotations(manager.annotations)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
      
        guard let annotation = mapView.selectedAnnotations.first else {
            return
        }
        selectedRestaurant = annotation as? RestaurantItem
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "custompin"
        guard !annotation.isKind(of: MKUserLocation.self)
        else {
            return nil
        }
        let annotationView : MKAnnotationView
        if let customAnnotationView =
            mapView.dequeueReusableAnnotationView(withIdentifier: identifier){
            annotationView = customAnnotationView
            annotationView.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        annotationView.canShowCallout = true
        if let image = UIImage(named:
                                "custom-annotation"){
            annotationView.image = image
            annotationView.centerOffset = CGPoint(
                x: -image.size.width/2,
                y: -image.size.height/2)
        }
        return annotationView
    }
}
