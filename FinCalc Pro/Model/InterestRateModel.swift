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
    
    //MARK: Calculate Interest Rate
    func calculateInterestRate() -> Double? {
        
        if presentValue <= 0 || futureValue <= 0 || periodicPayment < 0{
            return nil
        }
        
        if periodicPayment > 0 {
            let guess: Double = 0.1
            var r = guess // Initial guess for the interest rate
            var iteration = 0
            
            let tolerance: Double = 1.0e-6
            let maxIterations: Int = 100
            
            while iteration < maxIterations {
                let numerator = presentValue * pow(1 + r, Double(numberOfPeriods)) + periodicPayment * ((pow(1 + r, Double(numberOfPeriods)) - 1) / r) + futureValue
                let derivative = Double(numberOfPeriods) * presentValue * pow(1 + r, Double(numberOfPeriods) - 1) + periodicPayment * (Double(numberOfPeriods) * pow(1 + r, Double(numberOfPeriods) - 1) * r - (pow(1 + r, Double(numberOfPeriods)) - 1)) / (r * r)
                
                let newR = r - numerator / derivative
                
                if abs(newR - r) < tolerance {
                    return newR * 100
                }
                
                r = newR
                iteration += 1
            }
            return nil
        }
        else{
            let r = pow(futureValue / presentValue, 1.0 / Double(numberOfPeriods)) - 1.0
            return r * 100
        }
    }
}
