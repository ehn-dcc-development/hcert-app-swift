//
//  TestCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class TestCell: UITableViewCell {
    @IBOutlet weak var diseaseLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var sampleOriginLabel: UILabel!
    @IBOutlet weak var timestampSampleLabel: UILabel!
    @IBOutlet weak var timestampResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var facilityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var vm : TestCellViewModel?
    
    func setup(with vm: TestCellViewModel?) {
        diseaseLabel.text = vm?.disease ?? placeholder
        typeLabel.text = vm?.type ?? placeholder
        nameLabel.text = vm?.name ?? placeholder
        manufacturerLabel.text = vm?.manufacturer ?? placeholder
        sampleOriginLabel.text = vm?.sampleOrigin ?? placeholder
        timestampSampleLabel.text = vm?.timestampSample ?? placeholder
        timestampResultLabel.text = vm?.timestampResult ?? placeholder
        resultLabel.text = vm?.result ?? placeholder
        facilityLabel.text = vm?.facility ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
    }
}
