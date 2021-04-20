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
    let manufacturer: String?
    let sampleOrigin: String?
    let timestampSample: String?
    let timestampResult: String?
    let result: String?
    let facility: String?
    let country: String?

    init(from testResult: Test) {
        disease = testResult.disease
        manufacturer = testResult.manufacturer
        sampleOrigin = testResult.sampleOrigin
        timestampSample = testResult.timestampSample
        timestampResult = testResult.timestampResult
        result = testResult.result
        facility = testResult.facility
        country = testResult.country
    }
}
