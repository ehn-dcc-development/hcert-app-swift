//
//  CertificateMetadataCellViewModel.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import Foundation
import ValidationCore

struct CertificateMetadataCellViewModel : CellViewModel {
    var identifier = "CertificateMetadataCell"
    
    let issuer : String?
    let metadataIdentifier : String?
    let validFrom : String?
    let validUntil : String?
    let validUntilExtended : String?
    let revokeListIdentifier : String?
    let schemaVersion : String?
    let country : String?

    init?(from result: ValidationResult) {
        guard let metadata = result.payload.certificateMetadata else {
            return nil
        }
        issuer = metadata.issuer
        metadataIdentifier = metadata.identifier
        validFrom = metadata.validFrom
        validUntil = metadata.validUntil
        validUntilExtended = metadata.validUntilextended
        revokeListIdentifier = metadata.revokelistidentifier
        schemaVersion = metadata.schemaVersion
        country = metadata.country
    }
}
