//
//  LoanViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import Foundation

class LoanViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var loanAmount: String = ""
    @Published var loanTerm: String = "" // Number of months
    @Published var monthlyPayment: String = ""
    @Published var interestRate: String = ""
    
    @Published var errorMessage: String = ""
    @Published var calculatedValue: String = ""
    
    // MARK: - Methods
    
    func calculate() {
        // Reset error message and calculated value
        errorMessage = ""
        calculatedValue = ""
        
        // Count the number of non-empty inputs
        let nonEmptyInputs = [loanAmount, loanTerm, monthlyPayment, interestRate].filter { !$0.isEmpty }
        
        // Validate the number of inputs
        if nonEmptyInputs.count < 3 {
            errorMessage = "Please enter at least 3 variables to calculate the missing one."
            return
        } else if nonEmptyInputs.count == 4 {
            errorMessage = "All variables are already provided. No need to calculate."
            return
        }
        
        // Convert non-empty inputs to Double
        let loanAmountValue = loanAmount.isEmpty ? nil : Double(loanAmount)
        let loanTermValue = loanTerm.isEmpty ? nil : Double(loanTerm)
        let monthlyPaymentValue = monthlyPayment.isEmpty ? nil : Double(monthlyPayment)
        let interestRateValue = interestRate.isEmpty ? nil : Double(interestRate)
        
        // Check if all non-empty inputs are valid numbers
        if (loanAmountValue == nil && !loanAmount.isEmpty) ||
            (loanTermValue == nil && !loanTerm.isEmpty) ||
            (monthlyPaymentValue == nil && !monthlyPayment.isEmpty) ||
            (interestRateValue == nil && !interestRate.isEmpty) {
            errorMessage = "Please enter valid numbers for all fields."
            return
        }
        
        // Create LoanModel instance
        let loanModel = LoanModel(
            loanAmount: loanAmountValue,
            loanTerm: loanTermValue,
            monthlyPayment: monthlyPaymentValue,
            interestRate: interestRateValue
        )
        
        // Calculate the missing variable
        if loanAmount.isEmpty {
            if let calculatedLoanAmount = loanModel.calculateLoanAmount() {
                loanAmount = String(format: "%.2f", calculatedLoanAmount)
            } else {
                errorMessage = "Failed to calculate loan amount."
            }
        } else if loanTerm.isEmpty {
            if let calculatedLoanTerm = loanModel.calculateLoanTerm() {
                loanTerm = String(format: "%.0f", calculatedLoanTerm)
            } else {
                errorMessage = "Failed to calculate loan term."
            }
        } else if monthlyPayment.isEmpty {
            if let calculatedMonthlyPayment = loanModel.calculateMonthlyPayment() {
                monthlyPayment = String(format: "%.2f", calculatedMonthlyPayment)
            } else {
                errorMessage = "Failed to calculate monthly payment."
            }
        } else if interestRate.isEmpty {
            if let calculatedInterestRate = loanModel.calculateInterestRate() {
                interestRate = String(format: "%.2f", calculatedInterestRate)
            } else {
                errorMessage = "Failed to calculate interest rate."
            }
        }
    }
    
    // Reset the form
    func resetForm() {
        loanAmount = ""
        loanTerm = ""
        monthlyPayment = ""
        interestRate = ""
        errorMessage = ""
        calculatedValue = ""
    }
}
