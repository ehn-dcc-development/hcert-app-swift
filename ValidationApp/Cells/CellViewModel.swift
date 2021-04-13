//
//  CellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit

protocol CellViewModel {
    var identifier : String { get }
}

extension UITableViewCell {
    var placeholder : String { return "N/A" }
}
