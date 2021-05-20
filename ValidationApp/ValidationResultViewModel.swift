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
        var models : [CellViewModel?] = [validModel,
                      personModel]
        if let vaccinationModels = validationResult.payload.vaccinations?.compactMap({ VaccinationCellViewModel(from: $0) }) {
            models.append(contentsOf: vaccinationModels)
        }
        
        if let recoveryModels = validationResult.payload.recovery?.compactMap({ RecoveryCellViewModel(from: $0) }) {
            models.append(contentsOf: recoveryModels)
        }

        if let testModels = validationResult.payload.tests?.compactMap({ TestCellViewModel(from: $0) }) {
            models.append(contentsOf: testModels)
        }
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
