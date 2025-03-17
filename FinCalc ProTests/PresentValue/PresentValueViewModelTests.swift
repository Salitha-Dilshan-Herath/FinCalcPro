//
//  PresentValueViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro

class PresentValueViewModelTests: XCTestCase {

    var viewModel: PresentValueViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PresentValueViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Valid Inputs
    func testCalculateWithValidInputs() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.futureValue = "1000"
        viewModel.periodicPayment = "100"

        viewModel.calculate()

        if case .valid(let result) = viewModel.calculationResult {
            XCTAssertEqual(result, -1386.09, accuracy: 0.01, "Present value calculation with valid inputs is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }

    // MARK: - Test Invalid Inputs

    func testCalculateWithInvalidNumberOfPeriods() {
        viewModel.numberOfPeriods = "invalid"
        viewModel.interestPerYear = "5"
        viewModel.futureValue = "1000"
        viewModel.periodicPayment = "100"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidInterestPerYear() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "invalid"
        viewModel.futureValue = "1000"
        viewModel.periodicPayment = "100"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidFutureValue() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.futureValue = "invalid"
        viewModel.periodicPayment = "100"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidPeriodicPayment() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.futureValue = "1000"
        viewModel.periodicPayment = "invalid"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }
}
