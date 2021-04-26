//
//  VaccinationCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class VaccinationCell: UITableViewCell {
    @IBOutlet weak var diseaseLabel: UILabel!
    @IBOutlet weak var vaccineLabel: UILabel!
    @IBOutlet weak var medicinialProductLabel: UILabel!
    @IBOutlet weak var marketingAuthLabel: UILabel!
    @IBOutlet weak var vaccinationNumberLabel: UILabel!
    @IBOutlet weak var vaccinationDateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var certIssuerLabel: UILabel!
    @IBOutlet weak var certIdentifierLabel: UILabel!
    
    var vm : VaccinationCellViewModel?
    
    func setup(with vm: VaccinationCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        vaccineLabel.text = vm?.vaccine ?? placeholder
        medicinialProductLabel.text = vm?.medicinialProduct ?? placeholder
        marketingAuthLabel.text = vm?.marketingAuthorizationHolder ?? placeholder
        vaccinationNumberLabel.text = vm?.vaccinationNumber ?? placeholder
        vaccinationDateLabel.text = vm?.vaccinationDate ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
        certIssuerLabel.text = vm?.certificateIssuer ?? placeholder
        certIdentifierLabel.text = vm?.certificateIdentifier ?? placeholder
    }
}
