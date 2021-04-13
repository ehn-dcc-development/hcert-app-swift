//
//  ValidationResultViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit
import ValidationCore

struct ValidationResultViewModel {
    let result : ValidationResult
    var cellViewModels : [CellViewModel]
    
    init(validationResult: ValidationResult) {
        self.result = validationResult
        let validModel = ValidCellViewModel(from: self.result)
        let personModel = PersonCellViewModel(from: self.result)
        let personIdentifiers = self.result.payload.person?.identifier?.compactMap { PersonIdentifierCellViewModel(from: $0) }
        var models : [CellViewModel?] = [validModel,
                      personModel]
        if let personIdentifiers = personIdentifiers {
            models.append(contentsOf: personIdentifiers)
        }
        let vaccinationModels = self.result.payload.vaccinations?.compactMap { VaccinationCellViewModel(from: $0) }
        if let vaccinationModels = vaccinationModels {
            models.append(contentsOf: vaccinationModels)
        }
        models.append(PastInfectionCellViewModel(from: self.result))
        models.append(TestCellViewModel(from: self.result))
        models.append(CertificateMetadataCellViewModel(from: self.result))
        cellViewModels = models.compactMap {$0 as? CellViewModel}
    }
}
