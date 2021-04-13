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
    @IBOutlet weak var lotNumberLabel: UILabel!
    @IBOutlet weak var vaccinationDateLabel: UILabel!
    @IBOutlet weak var administeringCenterLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var vm : VaccinationCellViewModel?
    
    func setup(with vm: VaccinationCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        vaccineLabel.text = vm?.vaccine ?? placeholder
        medicinialProductLabel.text = vm?.medicinialProduct ?? placeholder
        marketingAuthLabel.text = vm?.marketingAuthorizationHolder ?? placeholder
        vaccinationNumberLabel.text = vm?.vaccinationNumber ?? placeholder
        lotNumberLabel.text = vm?.lotNumber ?? placeholder
        vaccinationDateLabel.text = vm?.vaccinationDate ?? placeholder
        administeringCenterLabel.text = vm?.administeringCentre ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
    }
}
