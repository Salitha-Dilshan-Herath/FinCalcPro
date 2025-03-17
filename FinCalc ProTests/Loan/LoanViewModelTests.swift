//
//  LoanViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class LoanViewModelTests: XCTestCase {

    var viewModel: LoanViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoanViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Valid Inputs

    func testCalculateLoanAmountWithValidInputs() {
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.loanAmount, "10598.14", "Loan amount calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateLoanTermWithValidInputs() {
        viewModel.loanAmount = "10000"
        viewModel.monthlyPayment = "200"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.loanTerm, "56", "Loan term calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateMonthlyPaymentWithValidInputs() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.monthlyPayment, "188.71", "Monthly payment calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateInterestRateWithValidInputs() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"

        viewModel.calculate()

        XCTAssertEqual(viewModel.interestRate, "7.41", "Interest rate calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    // MARK: - Test Invalid Inputs

    func testCalculateWithInvalidLoanAmount() {
        viewModel.loanAmount = "invalid"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid loan amount is incorrect")
    }

    func testCalculateWithInvalidLoanTerm() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "invalid"
        viewModel.monthlyPayment = "200"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid loan term is incorrect")
    }

    func testCalculateWithInvalidMonthlyPayment() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "invalid"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid monthly payment is incorrect")
    }

    func testCalculateWithInvalidInterestRate() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.interestRate = "invalid"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid interest rate is incorrect")
    }

    // MARK: - Test Edge Cases

    func testCalculateWithAllInputsProvided() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "All variables are already provided. No need to calculate.", "Error message for all inputs provided is incorrect")
    }

    func testCalculateWithLessThanThreeInputs() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter at least 3 variables to calculate the missing one.", "Error message for less than three inputs is incorrect")
    }

    func testCalculateWithZeroInterestRate() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.interestRate = "0"

        viewModel.calculate()

        XCTAssertEqual(viewModel.monthlyPayment, "166.67", "Monthly payment calculation with zero interest rate is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateWithZeroLoanAmount() {
        viewModel.loanAmount = "0"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"

        viewModel.calculate()
        
        XCTAssertEqual(viewModel.errorMessage, "Failed to calculate interest rate.")
    }

    // MARK: - Test Reset Form

    func testResetForm() {
        viewModel.loanAmount = "10000"
        viewModel.loanTerm = "60"
        viewModel.monthlyPayment = "200"
        viewModel.interestRate = "5"
        viewModel.errorMessage = "Test error message"
        viewModel.calculatedValue = "Test calculated value"

        viewModel.resetForm()

        XCTAssertTrue(viewModel.loanAmount.isEmpty, "Loan amount should be empty after reset")
        XCTAssertTrue(viewModel.loanTerm.isEmpty, "Loan term should be empty after reset")
        XCTAssertTrue(viewModel.monthlyPayment.isEmpty, "Monthly payment should be empty after reset")
        XCTAssertTrue(viewModel.interestRate.isEmpty, "Interest rate should be empty after reset")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty after reset")
        XCTAssertTrue(viewModel.calculatedValue.isEmpty, "Calculated value should be empty after reset")
    }
}
