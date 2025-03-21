//
//  LoanModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import Foundation

struct LoanModel {

    var loanAmount: Double?
    var loanTerm: Double?
    var monthlyPayment: Double?
    var interestRate: Double?
    
    // MARK: - Calculations

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
        let n = loanTerm
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
        
        let n = Double(loanTerm)
        var r = 0.005
        
        func loanEquation(r: Double) -> Double {
            return (loanAmount * r) / (1 - pow(1 + r, -n)) - monthlyPayment
        }
        
        for _ in 0..<100 {
            let f = loanEquation(r: r)
            let f_prime = (loanAmount * (pow(1 + r, -n) * (n * r - 1) + 1)) / pow(1 - pow(1 + r, -n), 2)
            
            let newR = r - f / f_prime
            if abs(newR - r) < 1e-6 { break }
            r = newR
        }
        
        return r * 12 * 100 
    }
}
