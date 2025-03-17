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
        
        if interestRate == 0 {
            // If interest rate is 0%, calculate loan amount using simple formula
            return monthlyPayment * Double(loanTerm)
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
        
        if interestRate == 0 {
            return loanAmount / Double(loanTerm)
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
        
        guard loanAmount > 0, loanTerm > 0, monthlyPayment > 0 else {
            return nil
        }
        
        let n = Double(loanTerm) // Loan term in months
        var r = 0.005 // Initial guess for monthly interest rate (0.5%)
        
        // Function to compute the difference between actual and expected monthly payment
        func loanEquation(r: Double) -> Double {
            return (loanAmount * r) / (1 - pow(1 + r, -n)) - monthlyPayment
        }
        
        // Newton-Raphson method to solve for r
        for _ in 0..<100 { // Limit iterations to avoid infinite loop
            let f = loanEquation(r: r)
            let f_prime = (loanAmount * (pow(1 + r, -n) * (n * r - 1) + 1)) / pow(1 - pow(1 + r, -n), 2)
            
            let newR = r - f / f_prime
            if abs(newR - r) < 1e-6 { break } // Convergence check
            r = newR
        }
        
        return r * 12 * 100 // Convert to annual percentage rate (APR)
    }
}
