//
//  TestCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class TestCell: UITableViewCell {
    @IBOutlet weak var diseaseLabel: UILabel!
    @IBOutlet weak var testnameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var timestampSampleLabel: UILabel!
    @IBOutlet weak var timestampResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var testCenterLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var certIssuerLabel: UILabel!
    @IBOutlet weak var certIdentifierLabel: UILabel!
    
    var vm : TestCellViewModel?
    
    func setup(with vm: TestCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        testnameLabel.text = vm?.testName ?? placeholder
        typeLabel.text = vm?.type ?? placeholder
        manufacturerLabel.text = vm?.manufacturer ?? placeholder
        timestampSampleLabel.text = vm?.timestampSample ?? placeholder
        timestampResultLabel.text = vm?.timestampResult ?? placeholder
        resultLabel.text = vm?.result ?? placeholder
        testCenterLabel.text = vm?.testCenter ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
        certIssuerLabel.text = vm?.certIssuer ?? placeholder
        certIdentifierLabel.text = vm?.certIdentifier ?? placeholder
    }
}
