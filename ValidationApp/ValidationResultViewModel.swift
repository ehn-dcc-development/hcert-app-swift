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
        let pastInfectionModels = self.result.payload.pastInfections?.compactMap { PastInfectionCellViewModel(from: $0) }
        if let pastInfectionModels = pastInfectionModels {
            models.append(contentsOf: pastInfectionModels)
        }

        let testModels = self.result.payload.tests?.compactMap { TestCellViewModel(from: $0) }
        if let testModels = testModels {
            models.append(contentsOf: testModels)
        }
        models.append(CertificateMetadataCellViewModel(from: self.result))
        cellViewModels = models.compactMap {$0}
    }
}
