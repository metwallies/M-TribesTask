//
//  PlaceMark.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMark: NSObject {

/*
         {
         "address":"Lesserstraße 170, 22049 Hamburg",
         "coordinates":[
         10.07526,
         53.59301,
         0
         ],
         "engineType":"CE",
         "exterior":"UNACCEPTABLE",
         "fuel":42,
         "interior":"UNACCEPTABLE",
         "name":"HH-GO8522",
         "vin":"WME4513341K565439"
         }
 */
    var address: String = ""
    var coordinates: Coordinate = Coordinate()
    var engingeType: String = ""
    var exterior: String = ""
    var fuel: Int = 0
    var interior: String = ""
    var name: String = ""
    var vin: String = ""
    
    init(json: [String: Any]) {
        address     = json["address"] as? String ?? ""
        coordinates = Coordinate(coord: json["coordinates"] as! [Double])
        engingeType = json["engineType"] as? String ?? ""
        exterior    = json["exterior"] as? String ?? ""
        fuel        = json["fuel"] as? Int ?? 0
        interior    = json["interior"] as? String ?? ""
        name        = json["name"] as? String ?? ""
        vin         = json["vin"] as? String ?? ""
    }
    
    func createMarker() -> GMSMarker {
        let position = CLLocationCoordinate2D(latitude: self.coordinates.lat, longitude: self.coordinates.lng)
        let marker: GMSMarker = GMSMarker(position: position)
        marker.title = self.name
        marker.snippet = self.address
        marker.userData = self.vin
        marker.icon = #imageLiteral(resourceName: "volkswagen-car-side-view")
        return marker
    }
}
