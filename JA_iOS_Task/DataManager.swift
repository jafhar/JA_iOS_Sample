//
//  DataManager.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Data reading from json file, we can read data from web service using same
protocol DataManager: class {
    
    associatedtype Model
    func loadData(withCompletion completion: @escaping (Model?) -> Void)
    func decode(_ data: Data) -> Model?
    
}


// MARK: - Data Loading Logic
extension DataManager {
    
    fileprivate func load(withCompletion completion: @escaping (Model?) -> Void) {
        
        if let file = Bundle.main.url(forResource: "jSONData", withExtension: "json") {
            do {
                let fileData = try Data(contentsOf: file)
                completion(self.decode(fileData))
                
            } catch {
                completion(nil)
                print("File Doesn't contain contents")
            }
        } else {
            print("Invalid Json")
        }
        
        }
    }


// MARK: - Preparing Web data loadings Request
class DataLoadRequest<Resource: DataManagerResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension DataLoadRequest: DataManager {
    func loadData(withCompletion completion: @escaping ([Resource.Model]?) -> Void) {
        load(withCompletion: completion)
    }

    func decode(_ data: Data) -> [Resource.Model]? {
        return resource.makeModel(data: data)
    }
    
}
