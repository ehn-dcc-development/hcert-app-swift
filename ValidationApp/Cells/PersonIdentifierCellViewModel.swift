//
//  PersonIdentifierCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct PersonIdentifierCellViewModel : CellViewModel {
    var identifier = "PersonIdentifierCell"
    
    let system : String?
    let value : String?
    let country : String?
    
    init(from personIdentifier: Identifier?){
        system = personIdentifier?.system
        value = personIdentifier?.value
        country = personIdentifier?.country
    }
}
