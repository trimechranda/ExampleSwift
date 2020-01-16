//
//  FirstCell.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 20120 TRIMECH. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(_ viewModel: FirstCellViewModel) {
        let  dateString = viewModel.dateStr
        let Temp = viewModel.temperature
        titleLabel.text = String("\(Temp)°")
        DateLabel.text = String (dateString! )

    }
    
}
