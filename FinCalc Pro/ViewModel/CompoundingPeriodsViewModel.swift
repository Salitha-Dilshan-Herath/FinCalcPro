//
//  CompoundingPeriodsViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-14.
//
import Foundation

class CompoundingPeriodsViewModel: ObservableObject{
    
    @Published var interestPerYear: String = ""
    @Published var presentValue: String = ""
    @Published var periodicPayment: String = ""
    @Published var futureValue: String = ""

    // Output (result)
    @Published var calculationResult: CalculationResult = .empty
    
    // Function to perform the calculation
    func calculate() {
        
        print(interestPerYear)
        print(presentValue)
        print(periodicPayment)
        print(futureValue)
        // Convert inputs to Double
        guard let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment),
              let fv = Double(futureValue) else {
            calculationResult = .invalidInput
            return
        }

        let model = CompoundingPeriods(interestPerYear: iy, presentValue: pv, periodicPayment: pmt, futureValue: fv)
        
        if let value = model.calculateNumberOfPeriods() {
            calculationResult = .valid(value)
        }else {
            calculationResult = .invalidInput
        }
       
    }
}
