//
//  HomeViewAPIDataManager.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewAPIDataManager: HomeViewAPIDataManagerProtocol {

    init() {}
    
    func fetchLocations(success: @escaping SuccessHandler, failure: @escaping FailureHandler){
        Alamofire.request(baseURL).responseJSON { response in
            if let json = response.result.value {
                success(json)
            }
            else {
                failure("An error occured")
            }
        }
    }
}
