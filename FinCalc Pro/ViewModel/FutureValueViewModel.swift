//
//  FutureValueViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation

class FutureValueViewModel: ObservableObject {

    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var presentValue: String = ""
    @Published var periodicPayment: String = ""
    @Published var calculationResult: CalculationResult = .empty
    
    //MARK: Function to perform the calculation
    func calculate() {

        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let pmt = Double(periodicPayment) else {
            calculationResult = .invalidInput
            return
        }

        let model = FutureValueModel(numberOfPeriods: n, interestPerYear: iy, presentValue: pv, periodicPayment: pmt)
        
        calculationResult = .valid(model.calculateFutureValue())
    }
}
