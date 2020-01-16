//
//  PrevisionModel.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import UIKit

class PrevisionModel: NSObject {
    
    var temperature : Int
    var pression: Int
    var humidite: Int
    var vent_moyen: Int
    var dateString : String

    init(dateString : String ,temperature: Int , pression: Int ,humidite: Int, vent_moyen: Int) {
        self.dateString = dateString
        self.temperature = temperature
        self.pression = pression
        self.humidite = humidite
        self.vent_moyen = vent_moyen
    }

}
