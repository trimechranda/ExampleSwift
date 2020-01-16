//
//  FirstCellViewModel.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import Foundation
import UIKit

class FirstCellViewModel {
    
    var previsionData : PrevisionModel
    var temperature : Int?
    var pression : Int?
    var humidite :Int?
    var vent_moyen: Int?
    var dateStr : String?
    
    let reuseIdentifier = "FirstCell"
    
    init(_ previsionData: PrevisionModel) {
        
        self.previsionData = previsionData
        self.temperature = previsionData.temperature
        self.pression = previsionData.pression
        self.humidite = previsionData.humidite
        self.vent_moyen = previsionData.vent_moyen
        self.dateStr = previsionData.dateString
        
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FirstCell
        cell.setup(self)
        return cell
    }

}
