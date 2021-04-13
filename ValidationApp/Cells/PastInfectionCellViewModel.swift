//
//  PastInfectionCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct PastInfectionCellViewModel : CellViewModel {
    var identifier = "PastInfectionCell"
    
    let disease : String?
    let dateFirstPositiveTest : String?
    let country : String?
    
    init(from pastInfection: PastInfection) {
        disease = pastInfection.disease
        dateFirstPositiveTest = pastInfection.dateFirstPositiveTest
        country = pastInfection.countryOfTest
    }
}
