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
    
    func calculateFutureValue() -> Double {
       
        let rate = interestPerYear / 100.0 // Convert interest rate to decimal
        let futureValueFactor = pow(1 + rate, numberOfPeriods)
        let annuityFactor = (futureValueFactor - 1) / rate
        
        return -(presentValue * futureValueFactor + periodicPayment * annuityFactor)
    }
}
