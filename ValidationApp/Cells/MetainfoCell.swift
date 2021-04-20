//
//  MetainfoCell.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 20.04.21.
//

import UIKit

class MetainfoCell: UITableViewCell {
    @IBOutlet weak var dgcidLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    var vm : MetainfoCellViewModel?
    
    func setup(with vm: MetainfoCellViewModel?) {
        dgcidLabel.text = vm?.dgcid
        versionLabel.text = vm?.version
    }
}
