//
//  PMTViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class PMTViewModelTests: XCTestCase {

    var viewModel: PMTViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PMTViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Valid Inputs

    func testCalculateWithValidInputs() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .valid(let pmt) = viewModel.calculationResult {
            XCTAssertEqual(pmt, -288.51, accuracy: 0.01, "PMT calculation with valid inputs is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }

    // MARK: - Test Invalid Inputs

    func testCalculateWithInvalidNumberOfPeriods() {
        viewModel.numberOfPeriods = "invalid"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

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
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidPresentValue() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "invalid"
        viewModel.futureValue = "2000"

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
        viewModel.presentValue = "1000"
        viewModel.futureValue = "invalid"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    // MARK: - Test Edge Cases

    func testCalculateWithZeroNumberOfPeriods() {
        viewModel.numberOfPeriods = "0"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithNegativeNumberOfPeriods() {
        viewModel.numberOfPeriods = "-10"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithZeroInterestPerYear() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "0"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .valid(let pmt) = viewModel.calculationResult {
            XCTAssertEqual(pmt, -300.00, accuracy: 0.01, "PMT calculation with zero interest is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithNegativeInterestPerYear() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "-5"
        viewModel.presentValue = "1000"
        viewModel.futureValue = "2000"

        viewModel.calculate()
        
        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }
}
