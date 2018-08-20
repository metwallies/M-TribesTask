//
//  Coordinate.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit

class Coordinate: NSObject {

    var lat: Double = 0.0
    var lng: Double = 0.0
    var height : Double = 0.0
    
    override init() {
        super.init()
    }
    
    init(coord: [Double]) {
        lat = coord[1]
        lng = coord[0]
        height = coord[2]
    }
}
