//
//  ValidCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class ValidCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    var vm : ValidCellViewModel?
    
    func setup(with vm: ValidCellViewModel?) {
        resultLabel.text = vm?.resultText
    }
    
}
