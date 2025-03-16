//
//  MortgageModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import Foundation

struct MortgageModel {
    // MARK: - Properties
    var housePrice: Double?
    var downPayment: Double?
    var monthlyPayment: Double?
    var loanTerm: Double? // Number of years
    var interestRate: Double? // Annual interest rate
    
    // MARK: - Calculations
    
    /// Calculate the house price based on other variables
    func calculateHousePrice() -> Double? {
        guard let downPayment = downPayment,
              let monthlyPayment = monthlyPayment,
              let loanTerm = loanTerm,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let n = loanTerm * 12 // Total number of payments (in months)
        let numerator = monthlyPayment * (1 - pow(1 + r, -n))
        let denominator = r
        return (numerator / denominator) + downPayment
    }
    
    /// Calculate the down payment based on other variables
    func calculateDownPayment() -> Double? {
        guard let housePrice = housePrice,
              let monthlyPayment = monthlyPayment,
              let loanTerm = loanTerm,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let n = loanTerm * 12 // Total number of payments (in months)
        let numerator = monthlyPayment * (1 - pow(1 + r, -n))
        let denominator = r
        return housePrice - (numerator / denominator)
    }
    
    /// Calculate the monthly payment based on other variables
    func calculateMonthlyPayment() -> Double? {
        guard let housePrice = housePrice,
              let downPayment = downPayment,
              let loanTerm = loanTerm,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let n = loanTerm * 12 // Total number of payments (in months)
        let loanAmount = housePrice - downPayment
        return (loanAmount * r) / (1 - pow(1 + r, -n))
    }
    
    /// Calculate the loan term (in years) based on other variables
    func calculateLoanTerm() -> Double? {
        guard let housePrice = housePrice,
              let downPayment = downPayment,
              let monthlyPayment = monthlyPayment,
              let interestRate = interestRate else {
            return nil
        }
        let r = interestRate / 1200 // Monthly interest rate
        let loanAmount = housePrice - downPayment
        let numerator = log(monthlyPayment / (monthlyPayment - r * loanAmount))
        let denominator = log(1 + r)
        return (numerator / denominator) / 12 // Convert months to years
    }
    
    /// Calculate the interest rate based on other variables
    func calculateInterestRate() -> Double? {
        guard let housePrice = housePrice,
                 let downPayment = downPayment,
                 let monthlyPayment = monthlyPayment,
                 let loanTerm = loanTerm else {
               return nil
           }
           
           let loanAmount = housePrice - downPayment
           let n = loanTerm * 12 // Total number of payments (months)
           
           var lowerBound = 0.0
           var upperBound = 100.0 // Assuming no interest rate will exceed 100%
           var guessRate = (lowerBound + upperBound) / 2.0
           
           while upperBound - lowerBound > 0.0001 {
               let r = guessRate / 1200
               let calculatedPayment = (loanAmount * r) / (1 - pow(1 + r, -n))
               
               if calculatedPayment > monthlyPayment {
                   upperBound = guessRate
               } else {
                   lowerBound = guessRate
               }
               
               guessRate = (lowerBound + upperBound) / 2.0
           }
           
           return guessRate
    }
}
