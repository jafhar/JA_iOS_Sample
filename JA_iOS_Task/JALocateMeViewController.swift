//
//  JALocateMeViewController.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class JALocateMeViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.showsScale = true
        mapView.showsCompass = true
        
        //TODO: Need to set Current location - Currently its hardcode
        let span = MKCoordinateSpan.init(latitudeDelta: 12.972442, longitudeDelta: 77.580643)
        let region = MKCoordinateRegion.init(center: (locationManager.location?.coordinate)!, span: span)
        mapView.setRegion(region, animated: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK: - Changing the Map Display Types
extension JALocateMeViewController {
    
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case MapType.StandardMap.rawValue:
            mapView.mapType = .standard
        case MapType.SatelliteMap.rawValue:
            mapView.mapType = .satellite
        case MapType.HybridMap.rawValue:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    
}


extension JALocateMeViewController {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
         mapView .setCenter(userLocation.coordinate, animated: true)
    }
}
