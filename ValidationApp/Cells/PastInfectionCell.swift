//
//  PastInfectionCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class PastInfectionCell: UITableViewCell {
    @IBOutlet weak var diseaseLabel: UILabel!
    @IBOutlet weak var dateFirstPositiveLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var vm : PastInfectionCellViewModel?
    
    func setup(with vm: PastInfectionCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        dateFirstPositiveLabel.text = vm?.dateFirstPositiveTest ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
    }
}
