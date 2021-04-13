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
    
    let disease: String?
    let vaccine: String?
    let medicinialProduct: String?
    let marketingAuthorizationHolder: String?
    private let number: UInt64?
    var vaccinationNumber : String? {
        get {
            guard let number = number else { return nil }
            return "\(number) of \(numberOf ?? 0)"
        }
    }
    
    private let numberOf: UInt64?
    let lotNumber: String?
    let vaccinationDate: String?
    let administeringCentre: String?
    let country: String?
    
    init(from vaccination: Vaccination) {
        disease = vaccination.disease
        vaccine = vaccination.vaccine
        medicinialProduct = vaccination.medicinialProduct
        marketingAuthorizationHolder = vaccination.marketingAuthorizationHolder
        number = vaccination.number
        numberOf = vaccination.numberOf
        lotNumber = vaccination.lotNumber
        vaccinationDate = vaccination.vaccinationDate
        administeringCentre = vaccination.administeringCentre
        country = vaccination.country
    }
}
