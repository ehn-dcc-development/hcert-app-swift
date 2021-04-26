//
//  MetainfoCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 20.04.21.
//

import Foundation
import ValidationCore

struct MetainfoCellViewModel : CellViewModel {
    var identifier = "MetainfoCell"
    
    let version : String
    
    init(from result: ValidationResult) {
        self.version = result.payload.version
    }
}
