//
//  JAModel.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import Foundation


// MARK: - Place Detail Model
struct PlaceDetail {
    var placeName:String
    var city:String
    var placeImageURL:String
    var placeInfo:String?
}

extension PlaceDetail {
    private enum Keys: String, JSONObjectKey {
        case placeName
        case city
        case placeImageURL
        case placeInfo
    }
    
    init(json: JSONObject) {
        placeName = json.value(forKey: Keys.placeName)!
        city = json.value(forKey: Keys.city)!
        placeImageURL = json.value(forKey: Keys.placeImageURL)!
        if let info:String = json.value(forKey: Keys.placeInfo) {
            placeInfo = info
        }
    }
}

//MARK: - Different Map Types
enum MapType: NSInteger {
    case StandardMap = 0
    case SatelliteMap = 1
    case HybridMap = 2
}

