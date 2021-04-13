//
//  ValidViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct ValidCellViewModel : CellViewModel {
    var identifier = "ValidCell"
    
    let isValid : Bool
    var resultText : String {
        get {
            return "COSE is \(!isValid ? "NOT " : "")VALID"
        }
    }
    
    init(from result: ValidationResult) {
        self.isValid = result.isValid
    }
}
