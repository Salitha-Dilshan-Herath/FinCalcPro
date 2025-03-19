//
//  MortgageViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import Foundation

class MortgageViewModel: ObservableObject {
    
    @Published var housePrice: String = ""
    @Published var downPayment: String = ""
    @Published var monthlyPayment: String = ""
    @Published var loanTerm: String = ""
    @Published var interestRate: String = ""
    @Published var errorMessage: String = ""
    
    //MARK: Function to perform the calculation
    func calculate() {
        errorMessage = ""
        
        let nonEmptyInputs = [housePrice, downPayment, monthlyPayment, loanTerm, interestRate].filter { !$0.isEmpty }
        
        if nonEmptyInputs.count < 4 {
            errorMessage = "Please enter at least 4 variables to calculate the missing one."
            return
        } else if nonEmptyInputs.count == 5 {
            errorMessage = "All variables are already provided. No need to calculate."
            return
        }
        
        let housePriceValue = housePrice.isEmpty ? nil : Double(housePrice)
        let downPaymentValue = downPayment.isEmpty ? nil : Double(downPayment)
        let monthlyPaymentValue = monthlyPayment.isEmpty ? nil : Double(monthlyPayment)
        let loanTermValue = loanTerm.isEmpty ? nil : Double(loanTerm)
        let interestRateValue = interestRate.isEmpty ? nil : Double(interestRate)
        
        if (housePriceValue == nil && !housePrice.isEmpty) ||
            (downPaymentValue == nil && !downPayment.isEmpty) ||
            (monthlyPaymentValue == nil && !monthlyPayment.isEmpty) ||
            (loanTermValue == nil && !loanTerm.isEmpty) ||
            (interestRateValue == nil && !interestRate.isEmpty) {
            errorMessage = Constant.ERROR_ALERT_MESSAGE_INVALID_DATA
            return
        }
        
        let mortgageModel = MortgageModel(
            housePrice: housePriceValue,
            downPayment: downPaymentValue,
            monthlyPayment: monthlyPaymentValue,
            loanTerm: loanTermValue,
            interestRate: interestRateValue
        )
        
        // Calculate the missing variable
        if housePrice.isEmpty {
            if let calculatedHousePrice = mortgageModel.calculateHousePrice() {
                housePrice = String(format: "%.2f", calculatedHousePrice)
            } else {
                errorMessage = "Failed to calculate house price."
            }
        } else if downPayment.isEmpty {
            if let calculatedDownPayment = mortgageModel.calculateDownPayment() {
                downPayment = String(format: "%.2f", calculatedDownPayment)
            } else {
                errorMessage = "Failed to calculate down payment."
            }
        } else if monthlyPayment.isEmpty {
            if let calculatedMonthlyPayment = mortgageModel.calculateMonthlyPayment() {
                monthlyPayment = String(format: "%.2f", calculatedMonthlyPayment)
            } else {
                errorMessage = "Failed to calculate monthly payment."
            }
        } else if loanTerm.isEmpty {
            if let calculatedLoanTerm = mortgageModel.calculateLoanTerm() {
                loanTerm = String(format: "%.0f", calculatedLoanTerm)
            } else {
                errorMessage = "Failed to calculate loan term."
            }
        } else if interestRate.isEmpty {
            if let calculatedInterestRate = mortgageModel.calculateInterestRate() {
                interestRate = String(format: "%.2f", calculatedInterestRate)
            } else {
                errorMessage = "Failed to calculate interest rate."
            }
        }
    }
    
    // Reset the form
    func resetForm() {
        housePrice = ""
        downPayment = ""
        monthlyPayment = ""
        loanTerm = ""
        interestRate = ""
        errorMessage = ""
    }
}
