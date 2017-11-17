//
//  JASearchablePlaceViewController.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 17/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//MARK: Protocol to handle route for selected places
protocol JAThingDetailViewControllerProtocol {
    func dismissViewController(from satrtLocation:MKCoordinateSpan, to endLocation:MKCoordinateSpan)
}

class JASearchablePlaceViewController: UIViewController {
    
    //TODO: Need to Add IBoutlets and start and end location details
    
    var placeDetail:PlaceDetail? = nil
    var delegate:JAThingDetailViewControllerProtocol!

    @IBOutlet weak var searchableView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchableView.layer.cornerRadius = 10.0

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//MARK: - Action for finding the directions
extension JASearchablePlaceViewController {
    
    @IBAction func findRoute(_ sender: UIButton) {
        
        //TODO: Need to be taken from enterable field From and To
        let fromLocation = MKCoordinateSpan.init(latitudeDelta: 12.972442, longitudeDelta: 77.580643)
        let toLocation =  MKCoordinateSpan.init(latitudeDelta: 12.972442, longitudeDelta: 77.580643)
        self.delegate.dismissViewController(from: (fromLocation), to: (toLocation))
        self.dismiss(animated: true, completion:nil)
        
    }
    
}

//MARK: - Cancel
extension JASearchablePlaceViewController {
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
}
