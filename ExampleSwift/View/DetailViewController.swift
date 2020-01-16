//
//  DetailViewController.swift
//  ExampleSwift
//
//  Created by TRIMECH on 14/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ventMoyenLabel: UILabel!
    @IBOutlet weak var pressionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humiditeLabel: UILabel!
    
    var prevision : PrevisionModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetails ()
    }
    
    func displayDetails(){
        humiditeLabel.text = "\(prevision!.humidite)"
        temperatureLabel.text = "\(prevision!.temperature)°"
        pressionLabel.text = "\(prevision!.pression)"
        ventMoyenLabel.text = "\(prevision!.vent_moyen)"
    }
}
