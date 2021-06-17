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
    let errorDescription : String?
    
    init(from result: ValidationResult) {
        self.isValid = result.isValid
        self.errorDescription = result.error?.message
    }
    
    init(from error: ValidationError) {
        self.isValid = false
        self.errorDescription = error.message
    }
}
