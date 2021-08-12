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
    var validationCore = ValidationCore(trustlistService: nil, dateService: nil, trustlistUrl: nil, signatureUrl: nil, trustAnchor: nil)
    
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
        }
    }

    /*
    private func testBusinessRules() {
        var sigRequest = URLRequest(url: URL(string: "https://dgc.a-sit.at/ehn/rules/v1/sig")!)
        sigRequest.addValue("application/octet-stream", forHTTPHeaderField: "Accept")
        var rulesRequest = URLRequest(url: URL(string: "https://dgc.a-sit.at/ehn/rules/v1/bin")!)
        rulesRequest.addValue("application/octet-stream", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: sigRequest) { sigData, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let sigData = sigData else {
               return
            }
            URLSession.shared.dataTask(with: rulesRequest) { rulesData, response, error in
                       guard error == nil,
                             let response = response as? HTTPURLResponse,
                             response.statusCode == 200,
                             let rulesData = rulesData else {
                          return
                       }
                 let decoded = try? self.validationCore.decode(businessRules: rulesData, signature: sigData, trustAnchor: "MIIBJTCBy6ADAgECAgUAwvEVkzAKBggqhkjOPQQDAjAQMQ4wDAYDVQQDDAVFQy1NZTAeFw0yMTA0MjMxMTI3NDhaFw0yMTA1MjMxMTI3NDhaMBAxDjAMBgNVBAMMBUVDLU1lMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/OV5UfYrtE140ztF9jOgnux1oyNO8Bss4377E/kDhp9EzFZdsgaztfT+wvA29b7rSb2EsHJrr8aQdn3/1ynte6MSMBAwDgYDVR0PAQH/BAQDAgWgMAoGCCqGSM49BAMCA0kAMEYCIQC51XwstjIBH10SN701EnxWGK3gIgPaUgBN+ljZAs76zQIhAODq4TJ2qAPpFc1FIUOvvlycGJ6QVxNXEkhRcgdlVfUb")
                 print(decoded)
                   }.resume()
        }.resume()
    }
    
    private func testValueset() {
        var sigRequest = URLRequest(url: URL(string: "https://dgc.a-sit.at/ehn/values/v1/sig")!)
        sigRequest.addValue("application/octet-stream", forHTTPHeaderField: "Accept")
        var rulesRequest = URLRequest(url: URL(string: "https://dgc.a-sit.at/ehn/values/v1/bin")!)
        rulesRequest.addValue("application/octet-stream", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: sigRequest) { sigData, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let sigData = sigData else {
               return
            }
            URLSession.shared.dataTask(with: rulesRequest) { valueSetData, response, error in
                       guard error == nil,
                             let response = response as? HTTPURLResponse,
                             response.statusCode == 200,
                             let valueSetData = valueSetData else {
                          return
                       }
                let decoded = try? self.validationCore.decode(valueSet: valueSetData, signature: sigData, trustAnchor: """
                    -----BEGIN CERTIFICATE-----
                                                              MIIBJTCBy6ADAgECAgUAwvEVkzAKBggqhkjOPQQDAjAQMQ4wDAYDVQQDDAVFQy1NZTAeFw0yMTA0MjMxMTI3NDh
                                                              aFw0yMTA1MjMxMTI3NDhaMBAxDjAMBgNVBAMMBUVDLU1lMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/OV5Uf
                                                              YrtE140ztF9jOgnux1oyNO8Bss4377E/kDhp9EzFZdsgaztfT+wvA29b7rSb2EsHJrr8aQdn3/1ynte6MSMBAwD
                                                              gYDVR0PAQH/BAQDAgWgMAoGCCqGSM49BAMCA0kAMEYCIQC51XwstjIBH10SN701EnxWGK3gIgPaUgBN+ljZAs76
                                                              zQIhAODq4TJ2qAPpFc1FIUOvvlycGJ6QVxNXEkhRcgdlVfUb
                                                              -----END CERTIFICATE-----
""")
                print(decoded)
                   }.resume()
        }.resume()
    }*/
}
