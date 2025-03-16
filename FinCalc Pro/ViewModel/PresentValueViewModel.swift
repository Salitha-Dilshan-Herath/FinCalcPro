//
//  PresentValueViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-15.
//

import Foundation

class PresentValueViewModel: ObservableObject{
    
    // Inputs from the user
    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var futureValue: String = ""
    @Published var periodicPayment: String = ""
    
    // Output (result)
    @Published var calculationResult: CalculationResult = .empty
    
    func calculate() {
        // Convert inputs to Double
        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let fv = Double(futureValue),
              let pmt = Double(periodicPayment) else {
            calculationResult = .invalidInput
            return
        }

        let model = PresentValueModel(numberOfPeriods: n, interestPerYear: iy, futureValue: fv, periodicPayment: pmt)
        
        calculationResult = .valid(model.calculatePresentValue())
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
