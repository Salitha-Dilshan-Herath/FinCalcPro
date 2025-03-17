//
//  LoanModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class LoanModelTests: XCTestCase {

    // MARK: - Test Calculate Loan Amount

    func testCalculateLoanAmountWithValidInputs() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: 60,
            monthlyPayment: 200,
            interestRate: 5
        )
        
        let loanAmount = model.calculateLoanAmount()
        XCTAssertNotNil(loanAmount, "Loan amount calculation with valid inputs failed")
        XCTAssertEqual(loanAmount!, 10598.14, accuracy: 0.01, "Loan amount calculation with valid inputs is incorrect")
    }

    func testCalculateLoanAmountWithMissingInputs() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: nil,
            monthlyPayment: 200,
            interestRate: 5
        )
        
        let loanAmount = model.calculateLoanAmount()
        XCTAssertNil(loanAmount, "Loan amount calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Loan Term

    func testCalculateLoanTermWithValidInputs() {
        let model = LoanModel(
            loanAmount: 10000,
            loanTerm: nil,
            monthlyPayment: 200,
            interestRate: 5
        )
        
        let loanTerm = model.calculateLoanTerm()
        XCTAssertNotNil(loanTerm, "Loan term calculation with valid inputs failed")
        XCTAssertEqual(loanTerm!, 56.18, accuracy: 0.01, "Loan term calculation with valid inputs is incorrect")
    }

    func testCalculateLoanTermWithMissingInputs() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: nil,
            monthlyPayment: 200,
            interestRate: 5
        )
        
        let loanTerm = model.calculateLoanTerm()
        XCTAssertNil(loanTerm, "Loan term calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Monthly Payment

    func testCalculateMonthlyPaymentWithValidInputs() {
        let model = LoanModel(
            loanAmount: 10000,
            loanTerm: 60,
            monthlyPayment: nil,
            interestRate: 5
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNotNil(monthlyPayment, "Monthly payment calculation with valid inputs failed")
        XCTAssertEqual(monthlyPayment!, 188.71, accuracy: 0.01, "Monthly payment calculation with valid inputs is incorrect")
    }

    func testCalculateMonthlyPaymentWithMissingInputs() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: 60,
            monthlyPayment: nil,
            interestRate: 5
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNil(monthlyPayment, "Monthly payment calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Interest Rate

    func testCalculateInterestRateWithValidInputs() {
        let model = LoanModel(
            loanAmount: 10000,
            loanTerm: 60,
            monthlyPayment: 200,
            interestRate: nil
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNotNil(interestRate, "Interest rate calculation with valid inputs failed")
        XCTAssertEqual(interestRate!, 7.40, accuracy: 0.01, "Interest rate calculation with valid inputs is incorrect")
    }

    func testCalculateInterestRateWithMissingInputs() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: 60,
            monthlyPayment: 200,
            interestRate: nil
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with missing inputs should return nil")
    }

    // MARK: - Test Edge Cases

    func testCalculateLoanAmountWithZeroInterestRate() {
        let model = LoanModel(
            loanAmount: nil,
            loanTerm: 60,
            monthlyPayment: 200,
            interestRate: 0
        )
        
        let loanAmount = model.calculateLoanAmount()
        XCTAssertNotNil(loanAmount, "Loan amount calculation with zero interest rate failed")
        XCTAssertEqual(loanAmount!, 12000.00, accuracy: 0.01, "Loan amount calculation with zero interest rate is incorrect")
    }

    func testCalculateMonthlyPaymentWithZeroInterestRate() {
        let model = LoanModel(
            loanAmount: 10000,
            loanTerm: 60,
            monthlyPayment: nil,
            interestRate: 0
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNotNil(monthlyPayment, "Monthly payment calculation with zero interest rate failed")
        XCTAssertEqual(monthlyPayment!, 166.67, accuracy: 0.01, "Monthly payment calculation with zero interest rate is incorrect")
    }

    func testCalculateInterestRateWithZeroLoanAmount() {
        let model = LoanModel(
            loanAmount: 0,
            loanTerm: 60,
            monthlyPayment: 200,
            interestRate: nil
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with zero loan amount should return nil")
    }
}
