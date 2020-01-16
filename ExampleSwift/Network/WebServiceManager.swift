//
//  WebServiceManager.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


protocol NetworkManagerDelegate {
    func dataReceived(data: Any?, error: NSError?)
}

class WebServiceManager: NSObject{
    
    var delegate: NetworkManagerDelegate?

    
    func getAllPrevision(position: CLLocation){
      
        let latitude : String = String(position.coordinate.latitude)
        let longitude : String = String(position.coordinate.longitude)
        let urlString : String = "http://www.infoclimat.fr/public-api/gfs/json?_ll=\(latitude),\(longitude)&_auth=AhhfSAJ8XH4FKAcwUiQLIlQ8BjNbLQYhAHwFZghgAH1WMl8yBGFXPV84UC0GKQcxU35QOV1lVWwFYwFgDX9WKgJjXzICaVw2BW8HZVJqCyBUeAZ7W2UGIQB8BWsIZgB9VjdfOAR5VzdfNFA6BigHNlNjUC9dfVVsBWMBYQ1oVjMCZl84AmBcOAVvB3pSfQs6VDIGZ1tsBm8AZwViCDEAa1ZjX20ENFdkXzlQLAY%2BBztTZ1A2XWJVbwVlAW4Nf1YqAhhfSAJ8XH4FKAcwUiQLIlQyBjhbMA%3D%3D&_c=3eb30c35c1bf7c5fbbd9374c3f795208"
        
        Alamofire.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    return
                }
                let mappedModel = try? JSONDecoder().decode([PrevisionResponse].self, from: response.data!)
                self.delegate!.dataReceived(data: json, error: nil)
                
            case .failure(let error):
                self.delegate!.dataReceived(data: nil, error: error as NSError)
            }
        }
    }
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
