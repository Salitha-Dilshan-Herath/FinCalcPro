//
//  InterestRate.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//
import Foundation

struct InterestRateModel {
    var numberOfPeriods: Int
    var presentValue: Double
    var periodicPayment: Double
    var futureValue: Double

    func calculateInterestRate() -> Double? {
        
        if periodicPayment > 0 {
            let guess: Double = 0.1
            var r = guess // Initial guess for the interest rate
            var iteration = 0
            
            let tolerance: Double = 1.0e-6
            let maxIterations: Int = 100
            
            while iteration < maxIterations {
                // Calculate the present value of the annuity formula
                let numerator = presentValue * pow(1 + r, Double(numberOfPeriods)) + periodicPayment * ((pow(1 + r, Double(numberOfPeriods)) - 1) / r) + futureValue
                // Calculate the derivative of the formula with respect to r
                let derivative = Double(numberOfPeriods) * presentValue * pow(1 + r, Double(numberOfPeriods) - 1) + periodicPayment * (Double(numberOfPeriods) * pow(1 + r, Double(numberOfPeriods) - 1) * r - (pow(1 + r, Double(numberOfPeriods)) - 1)) / (r * r)
                
                // Update the guess using Newton-Raphson method
                let newR = r - numerator / derivative
                
                // Check for convergence
                if abs(newR - r) < tolerance {
                    return newR
                }
                
                r = newR
                iteration += 1
            }
            return nil
        }
        else{
            // Calculate the interest rate using the formula
            let r = pow(futureValue / presentValue, 1.0 / Double(numberOfPeriods)) - 1.0
            
            return r
        }
    }
}
