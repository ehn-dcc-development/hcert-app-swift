//
//  ValidationResultViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit
import ValidationCore

protocol ResultViewModel {
    var cellViewModels : [CellViewModel] { get }
}

struct ValidationResultViewModel : ResultViewModel {
    var cellViewModels: [CellViewModel]
    
    init(validationResult: ValidationResult) {
        let validModel = ValidCellViewModel(from: validationResult)
        let personModel = PersonCellViewModel(from: validationResult)
        let personIdentifiers = validationResult.payload.person.identifier?.compactMap { PersonIdentifierCellViewModel(from: $0) }
        var models : [CellViewModel?] = [validModel,
                      personModel]
        if let personIdentifiers = personIdentifiers {
            models.append(contentsOf: personIdentifiers)
        }
        let vaccinationModels = validationResult.payload.vaccinations?.compactMap { VaccinationCellViewModel(from: $0) }
        if let vaccinationModels = vaccinationModels {
            models.append(contentsOf: vaccinationModels)
        }
        let pastInfectionModels = validationResult.payload.pastInfections?.compactMap { PastInfectionCellViewModel(from: $0) }
        if let pastInfectionModels = pastInfectionModels {
            models.append(contentsOf: pastInfectionModels)
        }

        let testModels = validationResult.payload.tests?.compactMap { TestCellViewModel(from: $0) }
        if let testModels = testModels {
            models.append(contentsOf: testModels)
        }
        models.append(CertificateMetadataCellViewModel(from: validationResult))
        
        models.append(MetainfoCellViewModel(from: validationResult))

        cellViewModels = models.compactMap {$0}
    }
}
struct ValidationErrorViewModel : ResultViewModel {
    var cellViewModels: [CellViewModel]
    
    init(error: ValidationError) {
        cellViewModels = [ValidCellViewModel(from: error)]
    }
}
