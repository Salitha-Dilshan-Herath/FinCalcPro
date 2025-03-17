//
//  MortgageViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class MortgageViewModelTests: XCTestCase {

    var viewModel: MortgageViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MortgageViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Valid Inputs

    func testCalculateHousePriceWithValidInputs() {
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.housePrice, "206281.62", "House price calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateDownPaymentWithValidInputs() {
        viewModel.housePrice = "200000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.downPayment, "13718.38", "Down payment calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateMonthlyPaymentWithValidInputs() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.monthlyPayment, "966.28", "Monthly payment calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateLoanTermWithValidInputs() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.loanTerm, "28", "Loan term calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    func testCalculateInterestRateWithValidInputs() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"

        viewModel.calculate()

        XCTAssertEqual(viewModel.interestRate, "5.30", "Interest rate calculation with valid inputs is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    // MARK: - Test Invalid Inputs

    func testCalculateWithInvalidHousePrice() {
        viewModel.housePrice = "invalid"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid house price is incorrect")
    }

    func testCalculateWithInvalidDownPayment() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "invalid"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid down payment is incorrect")
    }

    func testCalculateWithInvalidMonthlyPayment() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "invalid"
        viewModel.loanTerm = "30"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid monthly payment is incorrect")
    }

    func testCalculateWithInvalidLoanTerm() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "invalid"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid loan term is incorrect")
    }

    func testCalculateWithInvalidInterestRate() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.interestRate = "invalid"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter valid numbers for all fields.", "Error message for invalid interest rate is incorrect")
    }

    // MARK: - Test Edge Cases

    func testCalculateWithAllInputsProvided() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "All variables are already provided. No need to calculate.", "Error message for all inputs provided is incorrect")
    }

    func testCalculateWithLessThanFourInputs() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"

        viewModel.calculate()

        XCTAssertEqual(viewModel.errorMessage, "Please enter at least 4 variables to calculate the missing one.", "Error message for less than four inputs is incorrect")
    }

    func testCalculateWithZeroDownPayment() {
        viewModel.housePrice = "200000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"

        viewModel.calculate()
        
        print(viewModel.errorMessage.isEmpty)
        XCTAssertEqual(viewModel.housePrice, "200000", "House price calculation with zero down payment is incorrect")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty for valid inputs")
    }

    // MARK: - Test Reset Form

    func testResetForm() {
        viewModel.housePrice = "200000"
        viewModel.downPayment = "20000"
        viewModel.monthlyPayment = "1000"
        viewModel.loanTerm = "30"
        viewModel.interestRate = "5"
        viewModel.errorMessage = "Test error message"

        viewModel.resetForm()

        XCTAssertTrue(viewModel.housePrice.isEmpty, "House price should be empty after reset")
        XCTAssertTrue(viewModel.downPayment.isEmpty, "Down payment should be empty after reset")
        XCTAssertTrue(viewModel.monthlyPayment.isEmpty, "Monthly payment should be empty after reset")
        XCTAssertTrue(viewModel.loanTerm.isEmpty, "Loan term should be empty after reset")
        XCTAssertTrue(viewModel.interestRate.isEmpty, "Interest rate should be empty after reset")
        XCTAssertTrue(viewModel.errorMessage.isEmpty, "Error message should be empty after reset")
    }

    // MARK: - Test Show Help

    func testShowHelp() {
        viewModel.showHelp()

        XCTAssertEqual(viewModel.errorMessage, "Enter at least 4 variables to calculate the missing one. Leave one field empty.", "Help message is incorrect")
    }
}
