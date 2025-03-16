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
    
    func calculatePresentValue() -> Double {
        let r = interestPerYear / 100.0
        if periodicPayment > 0{
            let pvOfAnnuity = periodicPayment * ((1 - pow(1 + r, -numberOfPeriods)) / r)
            let pvOfFutureValue = futureValue / pow(1 + r, numberOfPeriods)
            
            let presentValue = -(pvOfAnnuity + pvOfFutureValue)
            return presentValue
        }else {
            let pvOfFutureValue = futureValue / pow(1 + r, numberOfPeriods)
            return pvOfFutureValue
        }
    }
    
    
}
