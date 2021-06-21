//
//  DebugCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 18.06.21.
//

import Foundation
import ValidationCore

struct DebugCellViewModel : CellViewModel {
    var identifier = "DebugCell"

    let issuer : String?
    let expirationDate : String?
    let issuedAtDate : String?
    let notBeforeDate : String?
    
    init(from result: MetaInfo) {
        self.issuer = result.issuer
        self.expirationDate = result.expirationTime
        self.issuedAtDate = result.issuedAt
        self.notBeforeDate = result.notBefore
    }
}
