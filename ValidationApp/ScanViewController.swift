//
//  ViewController.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 12.04.21.
//

import UIKit
import ValidationCore

class ScanViewController: UIViewController {
    var result : ValidationResult?
    var error : ValidationError?
    var validationCore = ValidationCore()
    
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var updateTrustlistButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EHN QR Code Scanner"
        updateTrustlistButton.layer.cornerRadius = 5
        updateTrustlistButton.backgroundColor = UIColor.systemBlue
        updateTrustlistButton.setTitleColor(UIColor.white, for: .normal)
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
        validationCore.updateTrustlist() { error in
            DispatchQueue.main.async {
                if let errorMessage = error?.message {
                    self.errorLabel.text = errorMessage
                    self.errorLabel.isHidden = false
                }
                self.updateTrustlistButton.isEnabled = true
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
            
//            switch(result) {
//            case .success(let validationResult):
//                self.result = validationResult
//                DispatchQueue.main.async {
//                    self.performSegue(withIdentifier: "showResult", sender: nil)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.error = error
//                    self.performSegue(withIdentifier: "showResult", sender: nil)
//                }
//            }
        }
    }
    
    private func show(errorMessage: String?) {
    }
    
}

