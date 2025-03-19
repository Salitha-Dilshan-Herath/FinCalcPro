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
    @Published var calculationResult: CalculationResult = .empty
    
    //MARK: Function to perform the calculation
    func calculate() {
        
        // Convert inputs to Double
        guard let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment),
              let fv = Double(futureValue),
              iy > 0 else {
            calculationResult = .invalidInput
            return
        }

        let model = CompoundingPeriodsModal(interestPerYear: iy, presentValue: pv, futureValue: fv, periodicPayment: pmt)
        
        if let value = model.calculateNumberOfPeriods() {
            calculationResult = .valid(value)
        }else {
            calculationResult = .invalidInput
        }
       
    }
}
