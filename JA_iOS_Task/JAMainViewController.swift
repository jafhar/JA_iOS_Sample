//
//  JAMainViewController.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit

class JAMainViewController: UIViewController {
    
    let segueIdentifier = "SegueToThingsToDo"
    let segueIdentifierForLocateMe = "SegueForLocateMe"
    var placesListAndDetails:[PlaceDetail]? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Fetching the place details list - We can call Web Service, Currently reading the data from json file hardcoded
        fetchThingsToDoList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


//MARK: - IBAction for Things to do in London
extension JAMainViewController {
    @IBAction func thingsToDoButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}


//MARK: - IBAction for Locate me button
extension JAMainViewController {
    @IBAction func locateMeButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentifierForLocateMe, sender: self)
    }
}


//MARK: - Preparing For Segue
extension JAMainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            
            let destinationViewController = segue.destination as! JAThingsListTableTableViewController
            destinationViewController.placeDetails = placesListAndDetails
            
        }else if  segue.identifier == segueIdentifierForLocateMe {
            print("Preparing segue for Locate Me")
        }
    }
}


extension JAMainViewController {
    
    // MARK: - Fetch Places List
    func fetchThingsToDoList() {
        let thingsListResource = PlaceResource()
        let thingsListRequest = DataLoadRequest(resource: thingsListResource)
        thingsListRequest.loadData { [weak self] (thingsList: [PlaceDetail?]?) in
            guard let places = thingsList else {
                return
            }
            self?.updateList(with: places)
        }

    }
}


private extension JAMainViewController {
    // MARK: - Update the fetched List
    func updateList(with placesList: [PlaceDetail?]) {

        placesListAndDetails = placesList as? [PlaceDetail]
        
    }
}



