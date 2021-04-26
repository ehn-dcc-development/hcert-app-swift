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
    @IBOutlet weak var validFromLabel: UILabel!
    @IBOutlet weak var validUntilLabel: UILabel!
    @IBOutlet weak var certIssuerLabel: UILabel!
    @IBOutlet weak var certIdentifierLabel: UILabel!
    
    var vm : PastInfectionCellViewModel?
    
    func setup(with vm: PastInfectionCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        dateFirstPositiveLabel.text = vm?.dateFirstPositiveTest ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
        validFromLabel.text = vm?.validFrom ?? placeholder
        validUntilLabel.text = vm?.validUntil ?? placeholder
        certIssuerLabel.text = vm?.certificateIssuer ?? placeholder
        certIdentifierLabel.text = vm?.certificateIdentifier ?? placeholder
    }
}
