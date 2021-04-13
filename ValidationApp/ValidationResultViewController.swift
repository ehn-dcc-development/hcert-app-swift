//
//  ValidationResultControllerViewController.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit
import ValidationCore

class ValidationResultViewController: UITableViewController {
    var vm : ValidationResultViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Validation Result"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.cellViewModels.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = vm?.cellViewModels[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier, for: indexPath)
        
        switch cell {
        case let validCell as ValidCell:
            validCell.setup(with: item as? ValidCellViewModel)
        case let personCell as PersonCell:
            personCell.setup(with: item as? PersonCellViewModel)
        case let vaccinationCell as VaccinationCell:
            vaccinationCell.setup(with: item as? VaccinationCellViewModel)
        case let pastInfectionCell as PastInfectionCell:
            pastInfectionCell.setup(with: item as? PastInfectionCellViewModel)
        case let testCell as TestCell:
            testCell.setup(with: item as? TestCellViewModel)
        case let certificateMetadataCell as CertificateMetadataCell:
            certificateMetadataCell.setup(with: item as? CertificateMetadataCellViewModel)
        case let personIdentifierCell as PersonIdentifierCell:
            personIdentifierCell.setup(with: item as? PersonIdentifierCellViewModel)
        default:
            break
        }
        
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
