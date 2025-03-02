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
    func calculateInterestRate() {
    
        interestRate = nil

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
        
        // Perform the calculation using Newton-Raphson method
        let tolerance = 1.0e-6 // Tolerance for convergence
        let maxIterations = 100 // Maximum number of iterations
        var r = 0.1 // Initial guess for interest rate
        
        for _ in 0..<maxIterations {
            let fValue = pv * pow(1 + r, n) + pmt * (pow(1 + r, n) - 1) / r - fv
            let fDerivative = pv * n * pow(1 + r, n - 1) + pmt * (n * pow(1 + r, n - 1) / r - (pow(1 + r, n) - 1) / (r * r))
            
            let rNew = r - fValue / fDerivative
            
            // Check for convergence
            if abs(rNew - r) < tolerance {
                interestRate = rNew * 100 // Convert to percentage
                return
            }
            
            r = rNew
        }
        
        // If the method did not converge
        calculationResult = .invalidInput
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
