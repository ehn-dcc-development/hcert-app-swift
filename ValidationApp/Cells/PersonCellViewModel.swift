//
//  PersonCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import  ValidationCore
import Foundation

struct PersonCellViewModel : CellViewModel {
    var identifier = "PersonCell"
    
    let name : String?
    let birthDate : String?

    init?(from result: ValidationResult) {
        guard let person = result.payload.person else {
            return nil
        }
        name = "\(person.givenName ?? "" ) \(person.familyName ?? "")"
        birthDate = person.birthDate
    }
 
}
