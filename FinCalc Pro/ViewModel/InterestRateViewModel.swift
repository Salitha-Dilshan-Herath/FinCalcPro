//
//  InterestRateModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation

class InterestRateViewModel: ObservableObject {
    // Inputs from the user
    @Published var numberOfPeriods: String = ""
    @Published var presentValue: String = ""
    @Published var periodicPayment: String = ""
    @Published var futureValue: String = ""
    @Published var calculationResult: CalculationResult = .empty
    @Published var interestRate: Double? = nil

    //MARK: Function to perform the calculation
    func calculate() {

        guard let n = Double(numberOfPeriods),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment),
              let fv = Double(futureValue) else {
            calculationResult = .invalidInput
            return
        }
        
        guard n > 0 else {
            calculationResult = .invalidInput
            return
        }
        
        let model = InterestRateModel(numberOfPeriods: Int(n), presentValue: pv, periodicPayment: pmt, futureValue: fv)
        
        if let rate = model.calculateInterestRate() {
            calculationResult = .valid(rate)
        } else {
            calculationResult = .invalidInput
        }
    }
}
