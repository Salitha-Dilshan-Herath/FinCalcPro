//
//  LoanModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import Foundation

struct LoanModel {
    // MARK: - Properties
    var loanAmount: Double?
    var loanTerm: Double? // Number of months
    var monthlyPayment: Double?
    var interestRate: Double? // Annual interest rate
    
    // MARK: - Calculations
    
    /// Calculate the loan amount based on other variables
    func calculateLoanAmount() -> Double? {
        guard let loanTerm = loanTerm,
              let monthlyPayment = monthlyPayment,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let n = loanTerm // Total number of payments (in months)
        let numerator = monthlyPayment * (1 - pow(1 + r, -n))
        let denominator = r
        return numerator / denominator
    }
    
    /// Calculate the loan term (in months) based on other variables
    func calculateLoanTerm() -> Double? {
        guard let loanAmount = loanAmount,
              let monthlyPayment = monthlyPayment,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let numerator = log(monthlyPayment / (monthlyPayment - r * loanAmount))
        let denominator = log(1 + r)
        return numerator / denominator
    }
    
    /// Calculate the monthly payment based on other variables
    func calculateMonthlyPayment() -> Double? {
        guard let loanAmount = loanAmount,
              let loanTerm = loanTerm,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let n = loanTerm // Total number of payments (in months)
        return (loanAmount * r) / (1 - pow(1 + r, -n))
    }
    
    /// Calculate the interest rate based on other variables
    func calculateInterestRate() -> Double? {
        guard let loanAmount = loanAmount,
              let loanTerm = loanTerm,
              let monthlyPayment = monthlyPayment else {
            return nil
        }
        // Simplified approximation for interest rate
        let n = loanTerm // Total number of payments (in months)
        return (monthlyPayment * n - loanAmount) / (loanAmount * n) * 1200
    }
}
