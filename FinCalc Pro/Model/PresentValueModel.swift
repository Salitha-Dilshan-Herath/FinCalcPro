//
//  PresentValue.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-15.
//

import Foundation

struct PresentValueModel {
    
    var numberOfPeriods: Double
    var interestPerYear: Double
    var futureValue: Double
    var periodicPayment: Double
    
    //MARK: Calculate Present Value
    func calculatePresentValue() -> Double {
        let r = interestPerYear / 100.0
        
        if r == 0 {
            // Handle case where the interest rate is zero
            let pvOfAnnuity = periodicPayment * numberOfPeriods
            let pvOfFutureValue = futureValue
            return -(pvOfAnnuity + pvOfFutureValue)
        }
        
        if periodicPayment > 0 {
            // For positive periodic payments
            let pvOfAnnuity = periodicPayment * ((1 - pow(1 + r, -numberOfPeriods)) / r)
            let pvOfFutureValue = futureValue / pow(1 + r, numberOfPeriods)
            
            let presentValue = -(pvOfAnnuity + pvOfFutureValue)
            return presentValue
        } else {
            // Compute present value of annuity (periodic payments)
            let pvOfAnnuity = periodicPayment * ((1 - pow(1 + r, -numberOfPeriods)) / r)
            let pvOfFutureValue = futureValue / pow(1 + r, numberOfPeriods)
            return -(pvOfAnnuity + pvOfFutureValue)
        }
    }
}
