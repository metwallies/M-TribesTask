//
//  ViewController.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/19/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController, HomeViewControllerProtocol {

    @IBOutlet weak var GMView: GMSMapView!
    @IBOutlet weak var placeMarkTableView: UITableView!
    var presenter: HomeViewPresenterProtocol?
    var placeMarks: [PlaceMark] = []
    var selectedMarker: GMSMarker?
    var markers: [GMSMarker] = []
    var isShowingMap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func fetchLocations() {
        self.presenter?.fetchLocations()
    }
    
    func setupView() {
        let rightButton = UIBarButtonItem(image: #imageLiteral(resourceName: "map"), style: .plain, target: self, action: #selector(self.toggleView(_:)))
        rightButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButton
        self.GMView.delegate = self
        self.fetchLocations()
    }
    
    func createMapMarkers() {
        markers = (self.presenter?.createMarker(placeMarks: placeMarks))!
        for marker: GMSMarker in markers {
            marker.map = GMView
        }
    }
    
    func setupMapCamera() {
        if self.placeMarks.count > 1{
            let placeMark = self.placeMarks[0]
            let camera = GMSCameraPosition.camera(withLatitude: placeMark.coordinates.lat, longitude: placeMark.coordinates.lng, zoom: 12.0)
            GMView.camera = camera
        }
    }
    
    @objc
    func toggleView(_ sender: UIBarButtonItem) {
        if isShowingMap {
            self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "map")
        } else {
            self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "list")
        }
        isShowingMap = !isShowingMap
        UIView.animate(withDuration: 0.3) {
            if self.isShowingMap {
                self.placeMarkTableView.alpha = 0.0
            } else {
                self.placeMarkTableView.alpha = 1.0
            }
        }
    }
}

extension HomeViewController {
    
    func didGetPlaceMarks(placeMarks: [PlaceMark]) {
        self.placeMarks = placeMarks
        self.createMapMarkers()
        self.setupMapCamera()
        self.placeMarkTableView.reloadData()
    }
    
    func didFailGetPlaceMarks(error: String) {
        let alert = UIAlertController(title: "error", message: error, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.show(alert, sender: self)
    }
}

extension HomeViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if selectedMarker == nil {
            selectedMarker = marker
            for tempMarker: GMSMarker in markers where tempMarker != selectedMarker {
                tempMarker.map = nil
            }
        } else {
            selectedMarker = nil
            for tempMarker: GMSMarker in markers {
                tempMarker.map = GMView
            }
        }
        return false
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeMarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlaceMarkTableViewCell = tableView.dequeueReusableCell(withIdentifier: placeMarkCellIdentifier, for: indexPath) as! PlaceMarkTableViewCell
        let tempPlaceMark: PlaceMark = placeMarks[indexPath.row]
        cell.configureCell(placeMark: tempPlaceMark)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
