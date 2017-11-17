//
//  JAThingsListTableTableViewController.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit
import MapKit

class JAThingsListTableTableViewController: UITableViewController {
    
    let segueIdentifierForDetail = "SegueForDetail"
    var placeDetails:[PlaceDetail]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: - Table view data source
extension JAThingsListTableTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = placeDetails?.count {
            return count
        } else {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: - Configuring the table cell
        let cellIdentifier = "ThingsTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! JAThingsTableViewCell
        let placeDetail:PlaceDetail = placeDetails![indexPath.row]
        cell.thingsTitle.text = placeDetail.placeName
        cell.thingsSubTitle.text = placeDetail.city
        cell.thingsImageView.image = UIImage.init(named: placeDetail.placeImageURL)
        cell.thingsImageView.contentMode = UIViewContentMode.scaleToFill
        return cell
    }

}


//MARK: - Action For Selecting a Row
extension JAThingsListTableTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifierForDetail, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - Preparing segue for detail
extension JAThingsListTableTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierForDetail {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedPlace = placeDetails?[indexPath.row]
                let destinationViewController = segue.destination as! JAThingDetailViewController
                destinationViewController.placeDetail = selectedPlace
            }
        }
    }
}
