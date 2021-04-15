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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EHN QR Code Scanner"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startScan()
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showResult":
            let target = segue.destination as? ValidationResultViewController
            if let result = self.result {
                target?.vm = ValidationResultViewModel(validationResult: result)
            }
        default:
            break
        }
    }

    private func startScan() {
        var validationCore = ValidationCore()
        validationCore.validateQrCode(self) { result in
            
            switch(result) {
            case .success(let validationResult):
                self.result = validationResult
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showResult", sender: nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                    self.startScan()
                }
            }
        }
    }

}

