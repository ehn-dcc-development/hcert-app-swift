//
//  TestCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct TestCellViewModel : CellViewModel {
    var identifier = "TestCell"
    
    let disease: String?
    let type: String?
    let name: String?
    let manufacturer: String?
    let sampleOrigin: String?
    let timeStampSample: String?
    let result: String?
    let facility: String?

    init(from testResult: Test) {
        disease = testResult.disease
        type = testResult.type
        name = testResult.name
        manufacturer = testResult.manufacturer
        sampleOrigin = testResult.sampleOrigin
        timeStampSample = testResult.timeStampSample
        result = testResult.result
        facility = testResult.facility
    }
}
