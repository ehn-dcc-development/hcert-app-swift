//
//  ContentView.swift
//  ValidationApp
//
//  Created by Dominik Mocher on 07.04.21.
//

import SwiftUI
import ValidationCore

struct ContentView: View {
    var body: some View {
        Button("Scan Code") {
            ValidationCore().validateQrCode { result in
                switch(result) {
                case .success(let validationResult): print(validationResult)
                case .failure(let error): print(error)
                }
            }
        }
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
