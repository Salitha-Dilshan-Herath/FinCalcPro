//
//  FutureValueModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation

struct FutureValueModel {
    var numberOfPeriods: Double
    var interestPerYear: Double
    var presentValue: Double
    var periodicPayment: Double
    
    //MARK: Calculate Future Value
    func calculateFutureValue() -> Double {
        
        let rate = interestPerYear / 100.0
        
        if rate == 0 {
            return -(presentValue + periodicPayment * numberOfPeriods)
        }
        
        if periodicPayment > 0 {
            // When periodic payment is positive (e.g., deposits), calculate the future value
            let futureValueFactor = pow(1 + rate, numberOfPeriods)
            let annuityFactor = (pow(1 + rate, numberOfPeriods) - 1) / rate
            return -(presentValue * futureValueFactor + periodicPayment * annuityFactor)
            
        } else {
            // When periodic payment is negative (e.g., withdrawals), future value should decrease
            let futureValue = presentValue * pow(1 + rate, numberOfPeriods)
            let annuityFactor = (pow(1 + rate, numberOfPeriods) - 1) / rate
            let result = futureValue - (-periodicPayment) * annuityFactor
            return -result
        }
    }
}
