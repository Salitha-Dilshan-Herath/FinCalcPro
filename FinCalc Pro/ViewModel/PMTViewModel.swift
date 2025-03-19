//
//  PMTViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import Foundation


class PMTViewModel: ObservableObject {

    @Published var numberOfPeriods: String = ""
    @Published var interestPerYear: String = ""
    @Published var presentValue: String = ""
    @Published var futureValue: String = ""
    @Published var calculationResult: CalculationResult = .empty
    
    //MARK: Function to perform the calculation
    func calculate() {
        
        guard let n = Double(numberOfPeriods),
              let iy = Double(interestPerYear),
              let pv = Double(presentValue),
              let fv = Double(futureValue) else {
            calculationResult = .invalidInput
            return
        }
        
        guard n > 0, iy >= 0 else {
            calculationResult = .invalidInput
            return
        }

        let model = PMTModel(numberOfPeriods: n, interestPerYear: iy, presentValue: pv, futureValue: fv)

        if let result = model.calPmt(){
            calculationResult = .valid(result)
        } else {
            calculationResult = .invalidInput
        }
        
    }
}
