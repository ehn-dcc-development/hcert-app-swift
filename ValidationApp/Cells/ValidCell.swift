//
//  ValidCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class ValidCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorDescriptionTitle: UILabel!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    var vm : ValidCellViewModel?
    
    func setup(with vm: ValidCellViewModel?) {
        resultLabel.text = vm?.resultText
        errorDescriptionLabel.text = vm?.errorDescription ?? "No error"
    }
    
}
