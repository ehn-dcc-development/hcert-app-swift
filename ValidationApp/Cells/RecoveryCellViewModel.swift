//
//  PastInfectionCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct RecoveryCellViewModel : CellViewModel {
    var identifier = "RecoveryCell"
    
    let disease : String?
    let dateFirstPositiveTest : String?
    let country : String?
    let certificateIssuer: String?
    let validFrom: String?
    let validUntil: String?
    let certificateIdentifier: String?
 
    
    init(from recovery: Recovery) {
        disease = DiseaseAgentTargeted(rawValue: recovery.disease)?.humanReadable() ?? recovery.disease
        dateFirstPositiveTest = recovery.dateFirstPositiveTest
        country = recovery.countryOfTest
        validFrom = recovery.validFrom
        validUntil = recovery.validUntil
        certificateIssuer = recovery.certificateIssuer
        certificateIdentifier = recovery.certificateIdentifier
    }
}
