//
//  CertificateMetadataCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class CertificateMetadataCell: UITableViewCell {
    @IBOutlet weak var issuerLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var validFromLabel: UILabel!
    @IBOutlet weak var validUntilLabel: UILabel!
    @IBOutlet weak var validUntilExtended: UILabel!
    @IBOutlet weak var revokeListIdentifier: UILabel!
    @IBOutlet weak var schemaVersionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var vm : CertificateMetadataCellViewModel?
    
    func setup(with vm: CertificateMetadataCellViewModel?) {
        issuerLabel.text = vm?.issuer ?? placeholder
        identifierLabel.text = vm?.metadataIdentifier ?? placeholder
        validFromLabel.text = vm?.validFrom ?? placeholder
        validUntilLabel.text = vm?.validUntil ?? placeholder
        validUntilExtended.text = vm?.validUntilExtended ?? placeholder
        revokeListIdentifier.text = vm?.revokeListIdentifier ?? placeholder
        schemaVersionLabel.text = vm?.schemaVersion ?? placeholder
        countryLabel.text = vm?.country ?? placeholder
    }
}
