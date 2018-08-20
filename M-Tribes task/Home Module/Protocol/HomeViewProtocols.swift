//
//  HomeViewProtocols.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit
import GoogleMaps

protocol HomeViewPresenterProtocol: class {
    var view: HomeViewControllerProtocol? {get set}
    var interactor: HomeViewInteractorProtocol? {get set}
    var wireframe: HomeViewWireframeProtocol? {get set}
    //All functions to be called from view to presenter
    //VIEW -> Presenter
    func fetchLocations()
    func createMarker(placeMarks: [PlaceMark]) -> [GMSMarker]
}

protocol HomeViewControllerProtocol: class {
    
    var presenter: HomeViewPresenterProtocol? {get set}
    //All functions to called from home presenter to home controller
    //PRESENTER -> VIEW
    func didGetPlaceMarks(placeMarks: [PlaceMark])
    func didFailGetPlaceMarks(error: String)
}

protocol HomeViewInteractorProtocol: class {
    var APIDataManager: HomeViewAPIDataManagerProtocol? {get set}
    var presenter: HomeViewInteractorOutputProtocol? {get set}
    //All functions to be called from presenter to Interactor
    //PRESENTER -> INTERACTOR
    func fetchLocations()
}

protocol HomeViewInteractorOutputProtocol: class {
    //All functions to be called from interactor to presenter
    //INTERACTOR -> PRESENTER
    func didGetLocation(placeMarks: [PlaceMark])
    func didFailGetLocation(error: String)
}

protocol HomeViewAPIDataManagerProtocol: class {
    
    //All functions to be called from interactor to API data manager
    //INTERACTOR -> API DATA MANAGER
    func fetchLocations(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}

protocol HomeViewWireframeProtocol: class {
    static func createHomeModule() -> HomeViewController
    //All functions to be called from PRESENTER to WIREFRAME
    //PRESENTER -> WIREFRAME
}
