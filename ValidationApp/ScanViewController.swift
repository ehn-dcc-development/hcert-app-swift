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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EHN QR Code Scanner"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        result = nil
        error = nil
        startScan()
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
        validationCore.validateQrCode(self) { result in
            
            switch(result) {
            case .success(let validationResult):
                self.result = validationResult
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }
            }
        }
    }

}

