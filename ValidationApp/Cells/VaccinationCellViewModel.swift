//
//  VaccinationCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct VaccinationCellViewModel : CellViewModel {
    var identifier = "VaccinationCell"
    
    let disease: String
    let vaccine: String
    let medicinialProduct: String
    let marketingAuthorizationHolder: String
    private let doseNumber: UInt64
    var vaccinationNumber : String? {
        get {
            return "\(doseNumber) of \(totalDoses)"
        }
    }
    
    private let totalDoses: UInt64
    let vaccinationDate: String
    let country: String
    let certificateIssuer: String
    let certificateIdentifier: String
 
    init(from vaccination: Vaccination) {
        disease = vaccination.disease.humanReadable()
        vaccine = vaccination.vaccine.humanReadable()
        medicinialProduct = vaccination.medicinialProduct.humanReadable()
        marketingAuthorizationHolder = vaccination.marketingAuthorizationHolder.humanReadable()
        doseNumber = vaccination.doseNumber
        totalDoses = vaccination.totalDoses
        vaccinationDate = vaccination.vaccinationDate
        country = vaccination.country
        certificateIssuer = vaccination.certificateIssuer
        certificateIdentifier = vaccination.certificateIdentifier
    }
}
