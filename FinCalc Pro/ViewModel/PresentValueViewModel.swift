//
//  PresentValueViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-15.
//

import Foundation

class PresentValueViewModel: ObservableObject{
    
    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var futureValue: String = ""
    @Published var periodicPayment: String = ""
    @Published var calculationResult: CalculationResult = .empty
    
    //MARK: Function to perform the calculation
    func calculate() {
        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let fv = Double(futureValue),
              let pmt = Double(periodicPayment) else {
            calculationResult = .invalidInput
            return
        }

        let model = PresentValueModel(numberOfPeriods: n, interestPerYear: iy, futureValue: fv, periodicPayment: pmt)
        
        calculationResult = .valid(model.calculatePresentValue())
    }
}
