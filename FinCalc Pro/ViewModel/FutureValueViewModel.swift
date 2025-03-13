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
    
    //MARK: Helper function to format numbers with thousand separators
    func formatNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "," // Use comma as the thousand separator
        formatter.maximumFractionDigits = 2 // Limit to 2 decimal places
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

enum CalculationResult {
    case valid(Double) // Valid result with a calculated value
    case invalidInput // Invalid input state
    case empty // No calculation has been performed yet
}
