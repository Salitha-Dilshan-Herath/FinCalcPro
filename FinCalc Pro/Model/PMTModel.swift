//
//  PMTModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-14.
//
import Foundation

struct PMTModel {
    var numberOfPeriods: Double
    var interestPerYear: Double
    var presentValue: Double
    var futureValue: Double
    
    func calPmt() -> Double {
        // Convert interest rate to decimal
        let r = interestPerYear / 100.0

        // Calculate PMT using the annuity formula
        return -(presentValue * r + (futureValue * r) / pow(1 + r, numberOfPeriods)) / (1 - pow(1 + r, -numberOfPeriods))
    }
}
