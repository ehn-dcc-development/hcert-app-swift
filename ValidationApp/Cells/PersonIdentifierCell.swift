//
//  PersonIdentifierCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class PersonIdentifierCell : UITableViewCell {
    @IBOutlet weak var systemLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    func setup(with vm: PersonIdentifierCellViewModel?) {
        systemLabel.text = vm?.system ?? placeholder
        valueLabel.text = vm?.value ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
    }
}
