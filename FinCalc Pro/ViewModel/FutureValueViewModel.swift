//
//  FutureValueViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation

class FutureValueViewModel: ObservableObject {
    // Inputs from the user
    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var presentValue: String = ""
    @Published var periodicPayment: String = ""
    
    // Output (result)
    @Published var calculationResult: CalculationResult = .empty
    
    // Function to perform the calculation
    func calculate() {
        // Convert inputs to Double
        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment) else {
            calculationResult = .invalidInput
            return
        }

        let model = FutureValueModel(numberOfPeriods: n, interestPerYear: iy, presentValue: pv, periodicPayment: pmt)
        
        calculationResult = .valid(model.calculateFutureValue())
    }
}
