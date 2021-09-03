//
//  ViewController.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit
import DccCachingService
import ValidationCore

class ScanViewController: UIViewController {
    var result : ValidationResult?
    var error : ValidationError?
    var cachingService = DccCachingService()
    lazy var validationCore = ValidationCore(trustlistService: cachingService.trustlistService)
    
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var updateTrustlistButton: UIButton!
    @IBOutlet weak var updateBusinessRulesButton: UIButton!
    @IBOutlet weak var updateValueSetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EHN QR Code Scanner"
        defaultStyle(for: updateTrustlistButton)
        defaultStyle(for: updateBusinessRulesButton)
        defaultStyle(for: updateValueSetButton)
    }
    
    func defaultStyle(for button: UIButton) {
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        result = nil
        error = nil
        errorLabel.isHidden = true
        startScan()
    }
    
    @IBAction func onUpdateTrustlist(_ sender: Any) {
        updateTrustlistButton.isEnabled = false
        errorLabel.isHidden = true
        cachingService.trustlistService.updateTrustlistIfNecessary() { error in
            DispatchQueue.main.async {
                if let errorMessage = error?.message {
                    self.errorLabel.text = errorMessage
                    self.errorLabel.isHidden = false
                }
                self.updateTrustlistButton.isEnabled = true
            }
        }
    }
    
    
    @IBAction func onUpdateBusinessRules(_ sender: Any) {
        errorLabel.isHidden = true
        updateBusinessRulesButton.isEnabled = false
        cachingService.businessRulesService.updateDataIfNecessary(force: true) { error in
            DispatchQueue.main.async {
                if let errorMessage = error?.message {
                    self.errorLabel.text = errorMessage
                    self.errorLabel.isHidden = false
                }
                self.updateBusinessRulesButton.isEnabled = true
            }
        }
    }
    
    
    @IBAction func onUpdateValueSets(_ sender: Any) {
        errorLabel.isHidden = true
        updateValueSetButton.isEnabled = false
        cachingService.valueSetService.updateDataIfNecessary(force: true) { error in
            DispatchQueue.main.async {
                if let errorMessage = error?.message {
                    self.errorLabel.text = errorMessage
                    self.errorLabel.isHidden = false
                }
                self.updateValueSetButton.isEnabled = true
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showResult":
            let target = segue.destination as? ValidationResultViewController
            if let result = self.result {
                target?.vm = ValidationResultViewModel(validationResult: result)
            }
            if let error = self.error {
                target?.vm = ValidationErrorViewModel(error: error)
            }
        default:
            break
        }
    }
    
    private func startScan() {
        validationCore.validateQrCode(qrView) { result in
            if let _ = result.greenpass {
                self.result = result
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }
                
            } else {
                DispatchQueue.main.async {
                    self.error = result.error
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }
            }
        }
    }

}
