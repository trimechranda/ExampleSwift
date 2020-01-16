//
//  FirstViewModel.swift
//  ExampleSwift
//
//  Created by TRIMECH on 16/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

protocol PrevisionViewModelProtocol {
    
    var previsionDidChanges: ((Bool, Bool) -> Void)? { get set }
    
}

class FirstViewModel: NSObject, PrevisionViewModelProtocol, NetworkManagerDelegate {
    
    //MARK: - Internal Properties
    
    var previsionDidChanges: ((Bool, Bool) -> Void)?
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentLoc: CLLocation!
    
    var previsionArray: [PrevisionModel]? {
        didSet {
            self.previsionDidChanges!(true, false)
        }
    }
    
    func checkInternetConnection() {
        if WebServiceManager().isConnectedToInternet() {
            fetchPrevisionWithlocation(key: currentLoc )
        } else {
            previsionArray = CoreDataManager().retrieveSavedPrevisions()!
        }
    }
    
    func fetchPrevisionWithlocation(key : CLLocation) {
        let networkManager = WebServiceManager()
        networkManager.delegate = self
        networkManager.getAllPrevision(position: key)
    }
    
    
    func dataReceived(data: Any?, error: NSError?) {
        
        if error != nil {
            print("Error: \(String(describing: error))")
        }
        
        guard let data = data else {
            print("Error: No data")
            return
        }
        let json = JSON(data)
        previsionArray = Utilities.loadPrevisionFromJSON(json: json)
        
    }
    
}

extension FirstViewModel: CLLocationManagerDelegate {
    
    func prepareLocation() {
        self.previsionArray = [PrevisionModel]()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if (authorizationStatus == CLAuthorizationStatus.notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLoc = manager.location
        manager.stopUpdatingLocation()
        checkInternetConnection()
    }
       
    
}

