//
//  Utilities.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import Foundation
import SwiftyJSON
class Utilities {
    
   class func loadPrevisionFromJSON(json: JSON) -> [PrevisionModel] {

    var previsionArray : [PrevisionModel] = []
    
    guard let previsionDataArray = json[].dictionary else {
        print("No array")
        return []
    }
    for prevision in previsionDataArray {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let someDate = prevision.key
        if dateFormatterGet.date(from: someDate) != nil {

        let temperature = prevision.value["temperature"]["2m"].intValue
        let degreTemp = temperature - 273
        let pression = prevision.value["pression"]["niveau_de_la_mer"].intValue
        let humidite = prevision.value["humidite"]["2m"].intValue
        let vent_moyen = prevision.value["vent_moyen"]["10m"].intValue
        let previsionsData = PrevisionModel (dateString : prevision.key,temperature: degreTemp , pression: pression , humidite:humidite , vent_moyen :vent_moyen )
        previsionArray.append(previsionsData)
       }
        }
    let CoreDataManagerr = CoreDataManager()
    CoreDataManagerr.savePrevisionData(previsionArray)
    return previsionArray
    }

    
}
