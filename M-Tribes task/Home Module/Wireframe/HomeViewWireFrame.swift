//
//  HomeViewWireFrame.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit

class HomeViewWireFrame: HomeViewWireframeProtocol {

    class func createHomeModule() -> HomeViewController {
        // Generating module components
        let view: HomeViewController = (HomeViewWireFrame.mainStoryboard.instantiateViewController(withIdentifier: homeViewSBIdentifier) as? HomeViewController)!
        let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
        let interactor: HomeViewInteractorProtocol = HomeViewInteractor()
        let APIDataManager: HomeViewAPIDataManagerProtocol = HomeViewAPIDataManager()
        let wireFrame: HomeViewWireframeProtocol = HomeViewWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        return view
    }
    
    static func getNavigationController() -> UINavigationController{
        let navigationController: UINavigationController = UINavigationController(rootViewController: HomeViewWireFrame.createHomeModule())
        return navigationController
    }
    
    static var mainStoryboard: UIStoryboard {
        let mainSB = "Main"
        return UIStoryboard(name: mainSB, bundle: nil)
    }
}
