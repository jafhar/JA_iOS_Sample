//
//  JAThingDetailViewController.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class JAThingDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var placeInformation: UITextView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var placeDetail:PlaceDetail? = nil
    
    let segueIdentifierForSearchablePlace = "SegueForNavigation"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        placeName.text = placeDetail?.placeName
        cityName.text = placeDetail?.city
        if let imageString = placeDetail?.placeImageURL {
            imageView.image = UIImage.init(named: imageString)
            imageView.contentMode = UIViewContentMode.scaleToFill
        }
        if let placeInfo = placeDetail?.placeInfo {
            placeInformation.text = placeInfo
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//MARK: - Action for finding the directions
extension JAThingDetailViewController {
    
    @IBAction func directions(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RouteViewController") as? JASearchablePlaceViewController {
            viewController.delegate = self
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController!.present(viewController, animated: true, completion: nil)
        }
    }
    
}


//MARK: - Preparing segue
extension JAThingDetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierForSearchablePlace {
            
            //TO DO : Pass the start and end locations to display in the map or Navigation
//            let destinationViewController = segue.destination as! JANavigationViewController

        }
    }
}


//MARK: Protocol confirmance to handle route
extension JAThingDetailViewController: JAThingDetailViewControllerProtocol {
    func dismissViewController(from satrtLocation:MKCoordinateSpan, to endLocation:MKCoordinateSpan) {
        //TO DO: Set from and To locations for navigation
        self.performSegue(withIdentifier: segueIdentifierForSearchablePlace, sender: self)
    }
}
