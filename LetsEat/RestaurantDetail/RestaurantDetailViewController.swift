//
//  RestaurantDetalTableViewController.swift
//  LetsEat
//
//  Created by Daya Pangestu on 05/05/22.
//

import UIKit
import MapKit
class RestaurantDetailViewController: UITableViewController {

    @IBOutlet var heartButton: UIBarButtonItem!
    @IBOutlet var locationMapImageView: UIImageView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var cuisineLabel: UILabel!
    @IBOutlet var headerAddressLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overallRatingLabel: UILabel!
    @IBOutlet var tableDetailLabel: UILabel!
    var selectedRestaurant : RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

private extension RestaurantDetailViewController {
    
    func initialize(){
        setupLabels()
        createMap()
    }
    
    func setupLabels(){
        guard let restaurant =
                selectedRestaurant else {
            return
        }
        title = restaurant.name
        nameLabel.text = restaurant.name
        cuisineLabel.text = restaurant.subtitle
        headerAddressLabel.text = restaurant.address
        tableDetailLabel.text = "Table for 7, tonight at 10:00 PM"
        addressLabel.text = restaurant.address
    }
    
    func createMap(){
        guard let annotation = selectedRestaurant, let long = annotation.long, let lat = annotation.lat else {
            return
        }
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        takeSnapshot(with: location)
    }
    
    func takeSnapshot(with location: CLLocationCoordinate2D){
        let mapSnapShotOptions = MKMapSnapshotter.Options()
        var loc = location
        let polyline = MKPolyline(coordinates: &loc, count: 1)
        let region = MKCoordinateRegion(polyline.boundingMapRect)
        mapSnapShotOptions.region =  region
        mapSnapShotOptions.scale = UIScreen.main.scale
        mapSnapShotOptions.size = CGSize(width: 340, height: 208)
        mapSnapShotOptions.showsBuildings = true
        mapSnapShotOptions.pointOfInterestFilter = .includingAll
        let snapShotter = MKMapSnapshotter(options: mapSnapShotOptions)
        snapShotter.start() { snapshot, error in
            guard let snapshot = snapshot else {
                return
            }
            UIGraphicsBeginImageContextWithOptions(
                mapSnapShotOptions.size, true, 0)
            snapshot.image.draw(at: .zero)
            let identifier = "custompin"
            let anotation = MKPointAnnotation()
            anotation.coordinate = location
            let pinView = MKPinAnnotationView(annotation: anotation, reuseIdentifier: identifier)
            pinView.image = UIImage(named: "custom=annotation")!
            let pinImage = pinView.image
            var point = snapshot.point(for: location)
            let rect = self.locationMapImageView.bounds
            if rect.contains(point){
                let pinCenterOffset = pinView.centerOffset
                point.x -= pinView.bounds.size.width / 2
                point.y -= pinView.bounds.size.height / 2
                point.x += pinCenterOffset.x
                point.y += pinCenterOffset.y
                pinImage?.draw(at: point)
            }
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                DispatchQueue.main.async {
                    self.locationMapImageView.image = image
                }
            }
            
        }
    }
    
}
