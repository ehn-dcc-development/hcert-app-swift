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
    let testName: String?
    let manufacturer: String?
    let timestampSample: String?
    let timestampResult: String?
    let result: String?
    let testCenter: String?
    let country: String?
    let certIssuer: String?
    let certIdentifier: String?

    init(from testResult: Test) {
        disease = DiseaseAgentTargeted(rawValue: testResult.disease)?.humanReadable() ?? testResult.disease
        type = TestType(rawValue: testResult.type)?.humanReadable() ?? testResult.type
        testName = testResult.testName
        manufacturer = TestManufacturer(rawValue: testResult.manufacturer ?? "")?.humanReadable() ?? testResult.manufacturer
        timestampSample = testResult.timestampSample
        timestampResult = testResult.timestampResult
        result = TestResult(rawValue: testResult.result)?.humanReadable() ?? testResult.result
        testCenter = testResult.testCenter
        country = testResult.country
        certIssuer = testResult.certificateIssuer
        certIdentifier = testResult.certificateIdentifier
    }
}
