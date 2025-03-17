//
//  MortgageModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//
import XCTest
@testable import FinCalc_Pro

class MortgageModelTests: XCTestCase {

    // MARK: - Test Calculate House Price

    func testCalculateHousePriceWithValidInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: 5
        )
        
        let housePrice = model.calculateHousePrice()
        XCTAssertNotNil(housePrice, "House price calculation with valid inputs failed")
        XCTAssertEqual(housePrice!, 206281.61, accuracy: 0.01, "House price calculation with valid inputs is incorrect")
    }

    func testCalculateHousePriceWithMissingInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: nil,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: 5
        )
        
        let housePrice = model.calculateHousePrice()
        XCTAssertNil(housePrice, "House price calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Down Payment

    func testCalculateDownPaymentWithValidInputs() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: nil,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: 5
        )
        
        let downPayment = model.calculateDownPayment()
        XCTAssertNotNil(downPayment, "Down payment calculation with valid inputs failed")
        XCTAssertEqual(downPayment!, 13718.39, accuracy: 0.01, "Down payment calculation with valid inputs is incorrect")
    }

    func testCalculateDownPaymentWithMissingInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: nil,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: 5
        )
        
        let downPayment = model.calculateDownPayment()
        XCTAssertNil(downPayment, "Down payment calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Monthly Payment

    func testCalculateMonthlyPaymentWithValidInputs() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: 20000,
            monthlyPayment: nil,
            loanTerm: 30,
            interestRate: 5
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNotNil(monthlyPayment, "Monthly payment calculation with valid inputs failed")
        XCTAssertEqual(monthlyPayment!, 966.28, accuracy: 0.01, "Monthly payment calculation with valid inputs is incorrect")
    }

    func testCalculateMonthlyPaymentWithMissingInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: 20000,
            monthlyPayment: nil,
            loanTerm: 30,
            interestRate: 5
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNil(monthlyPayment, "Monthly payment calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Loan Term

    func testCalculateLoanTermWithValidInputs() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: nil,
            interestRate: 5
        )
        
        let loanTerm = model.calculateLoanTerm()
        XCTAssertNotNil(loanTerm, "Loan term calculation with valid inputs failed")
        XCTAssertEqual(loanTerm!, 27.78, accuracy: 0.01, "Loan term calculation with valid inputs is incorrect")
    }

    func testCalculateLoanTermWithMissingInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: nil,
            interestRate: 5
        )
        
        let loanTerm = model.calculateLoanTerm()
        XCTAssertNil(loanTerm, "Loan term calculation with missing inputs should return nil")
    }

    // MARK: - Test Calculate Interest Rate

    func testCalculateInterestRateWithValidInputs() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: nil
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNotNil(interestRate, "Interest rate calculation with valid inputs failed")
        XCTAssertEqual(interestRate!, 5.30, accuracy: 0.01, "Interest rate calculation with valid inputs is incorrect")
    }

    func testCalculateInterestRateWithMissingInputs() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: nil
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with missing inputs should return nil")
    }

    // MARK: - Test Edge Cases

    func testCalculateHousePriceWithZeroDownPayment() {
        let model = MortgageModel(
            housePrice: nil,
            downPayment: 0,
            monthlyPayment: 1000,
            loanTerm: 30,
            interestRate: 5
        )
        
        let housePrice = model.calculateHousePrice()
        XCTAssertNotNil(housePrice, "House price calculation with zero down payment failed")
        XCTAssertEqual(housePrice!, 186281.61, accuracy: 0.01, "House price calculation with zero down payment is incorrect")
    }

    func testCalculateMonthlyPaymentWithZeroInterestRate() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: 20000,
            monthlyPayment: nil,
            loanTerm: 30,
            interestRate: 0
        )
        
        let monthlyPayment = model.calculateMonthlyPayment()
        XCTAssertNotNil(monthlyPayment, "Monthly payment calculation with zero interest rate failed")
        XCTAssertEqual(monthlyPayment!, 500.00, accuracy: 0.01, "Monthly payment calculation with zero interest rate is incorrect")
    }

    func testCalculateLoanTermWithZeroInterestRate() {
        let model = MortgageModel(
            housePrice: 200000,
            downPayment: 20000,
            monthlyPayment: 1000,
            loanTerm: nil,
            interestRate: 0
        )
        
        let loanTerm = model.calculateLoanTerm()
        XCTAssertNotNil(loanTerm, "Loan term calculation with zero interest rate failed")
        XCTAssertEqual(loanTerm!, 15.00, accuracy: 0.01, "Loan term calculation with zero interest rate is incorrect")
    }
}
