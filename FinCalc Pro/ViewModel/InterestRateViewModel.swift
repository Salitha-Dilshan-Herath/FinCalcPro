//
//  InterestRateModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation

class InterestRateViewModel: ObservableObject {
    // Inputs from the user
    @Published var numberOfPeriods: String = ""
    @Published var presentValue: String = ""
    @Published var periodicPayment: String = ""
    @Published var futureValue: String = ""
    
    // Output (result)
    @Published var calculationResult: CalculationResult = .empty
    @Published var interestRate: Double? = nil

    // Function to calculate interest rate
    func calculate() {

        // Convert inputs to Double
        guard let n = Double(numberOfPeriods),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment),
              let fv = Double(futureValue) else {
            calculationResult = .invalidInput
            return
        }
        
        // Validate inputs
        guard n > 0 else {
            calculationResult = .invalidInput
            return
        }
        
        let model = InterestRateModel(numberOfPeriods: Int(n), presentValue: pv, periodicPayment: pmt, futureValue: fv)
        
        if let rate = model.calculateInterestRate() {
            calculationResult = .valid(rate * 100)
        } else {
            calculationResult = .invalidInput
        }
    }
    
    // Helper function to format numbers with thousand separators
    func formatNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "," // Use comma as the thousand separator
        formatter.maximumFractionDigits = 2 // Limit to 2 decimal places
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
