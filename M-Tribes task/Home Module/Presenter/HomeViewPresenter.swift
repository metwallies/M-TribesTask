//
//  HomeViewPresenter.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewPresenter: HomeViewPresenterProtocol {

    weak var view: HomeViewControllerProtocol?
    var interactor: HomeViewInteractorProtocol?
    var wireframe: HomeViewWireframeProtocol?
    
    init() {}
    
    func fetchLocations() {
        self.interactor?.fetchLocations()
    }
    
    func createMarker(placeMarks: [PlaceMark]) -> [GMSMarker] {
        var markers: [GMSMarker] = []
        for placeMark: PlaceMark in placeMarks {
            let marker: GMSMarker = placeMark.createMarker()
            markers.append(marker)
        }
        return markers
    }
}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    
    func didGetLocation(placeMarks: [PlaceMark]) {
        self.view?.didGetPlaceMarks(placeMarks: placeMarks)
    }
    
    func didFailGetLocation(error: String) {
        self.view?.didFailGetPlaceMarks(error: error)
    }
}
