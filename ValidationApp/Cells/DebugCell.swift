//
//  DebugCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

class DebugCell: UITableViewCell {

    @IBOutlet weak var issuerLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var notBeforeLabel: UILabel!
    @IBOutlet weak var issuedAtLabel: UILabel!
    

    func setup(with vm: DebugCellViewModel?) {
        issuerLabel.text = vm?.issuer ?? placeholder
        expirationLabel.text = vm?.expirationDate ?? placeholder
        notBeforeLabel.text = vm?.notBeforeDate ??  placeholder
        issuedAtLabel.text = vm?.issuedAtDate ?? placeholder
    }
    
}
