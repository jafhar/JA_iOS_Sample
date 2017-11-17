//
//  DataResource.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 17/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import Foundation

//MARK: - Wrapper for fetching the object from json
struct JsonWrapper {
    let placesList: [JSONObject]
}

extension JsonWrapper {
    private enum Keys: String, JSONObjectKey {
        case placesList
    }
    
    init(serialization: JSONObject) {
        placesList = serialization.value(forKey: Keys.placesList) ?? []
    }
}


// MARK: - Data Manager Resource
protocol DataManagerResource {
    associatedtype Model
    func makeModelFrom(json: JSONObject) -> Model
}

extension DataManagerResource {
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        guard let jsonSerialization = json as? JSONObject else {
            return nil
        }
        let wrapper = JsonWrapper(serialization: jsonSerialization)
        return wrapper.placesList.map(makeModelFrom(json:))
    }
}

// MARK: - Resource For Fetching Place Detail list
struct PlaceResource: DataManagerResource {
    func makeModelFrom(json: JSONObject) -> PlaceDetail? {
        return PlaceDetail(json:json)
    }
}
