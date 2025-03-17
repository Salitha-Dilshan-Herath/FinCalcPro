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
    
    func calPmt() -> Double? {
        let r = interestPerYear / 100.0
        
        if r == 0 {
            return -(futureValue + presentValue) / numberOfPeriods
        }
        
        if r <= -1 {
            return nil
        }
        
        
        return -(presentValue * r + (futureValue * r) / pow(1 + r, numberOfPeriods)) / (1 - pow(1 + r, -numberOfPeriods))
    }
}
