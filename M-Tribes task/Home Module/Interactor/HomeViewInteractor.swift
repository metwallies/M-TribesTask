//
//  HomeViewInteractor.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit

class HomeViewInteractor: HomeViewInteractorProtocol {

    weak var presenter: HomeViewInteractorOutputProtocol?
    var APIDataManager: HomeViewAPIDataManagerProtocol?
    
    init() {}
    
    func fetchLocations() {
        self.APIDataManager?.fetchLocations(success: { (json) in
            let result: [PlaceMark] = self.parsePlaceMarks(json: json as! [String : Any])
            self.presenter?.didGetLocation(placeMarks: result)
        }, failure: { (error) in
            self.presenter?.didFailGetLocation(error: error)
        })
    }
    
    func parsePlaceMarks(json: [String: Any]) -> [PlaceMark] {
        let data: [[String: Any]] = json["placemarks"] as! [[String: Any]]
        var placeMarks: [PlaceMark] = [PlaceMark]()
        
        for placeMarkJson: [String: Any] in data {
            let tempPlaceMark: PlaceMark = PlaceMark(json: placeMarkJson)
            placeMarks.append(tempPlaceMark)
        }
        
        return placeMarks
    }
}
