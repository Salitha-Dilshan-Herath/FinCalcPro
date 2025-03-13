//
//  PMTViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation


class PMTViewModel: ObservableObject {
    // Inputs from the user
    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var presentValue: String = ""
    @Published var futureValue: String = ""
    
    // Output (result)
    @Published var calculationResult: CalculationResult = .empty
    
    // Function to calculate PMT
    func calculate() {
        
        // Convert inputs to Double
        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let fv = Double(futureValue) else {
            calculationResult = .invalidInput
            return
        }
        
        // Validate inputs
        guard n > 0, iy >= 0 else {
            calculationResult = .invalidInput
            return
        }

        let model = PMTModel(numberOfPeriods: n, interestPerYear: iy, presentValue: pv, futureValue: fv)

        // Set the result
        calculationResult = .valid(model.calPmt())
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
