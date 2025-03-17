//
//  CompoundingPeriodsViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class CompoundingPeriodsViewModelTests: XCTestCase {

    var viewModel: CompoundingPeriodsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CompoundingPeriodsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Test Valid Inputs
    func testCalculateWithValidInputs() {
        viewModel.interestPerYear = "4"
        viewModel.presentValue = "100000"
        viewModel.periodicPayment = "0"
        viewModel.futureValue = "300000"

        viewModel.calculate()
        
        if case .valid(let periods) = viewModel.calculationResult {
            XCTAssertEqual(periods, 28.01, accuracy: 0.01, "Number of periods calculation with valid inputs is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }

    // MARK: - Test Invalid Inputs
    func testCalculateWithInvalidInterestPerYear() {
        viewModel.interestPerYear = "invalid"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidPresentValue() {
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "invalid"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidPeriodicPayment() {
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "invalid"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithInvalidFutureValue() {
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "invalid"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    // MARK: - Test Edge Cases

    func testCalculateWithZeroInterestPerYear() {
        viewModel.interestPerYear = "0"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithZeroPresentValue() {
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "0"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithZeroFutureValue() {
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "0"

        viewModel.calculate()

        if case .valid(let periods) = viewModel.calculationResult {
            XCTAssertEqual(periods, 14.20, accuracy: 0.01, "Number of periods calculation with valid inputs is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }

    func testCalculateWithNegativeInterestPerYear() {
        viewModel.interestPerYear = "-5"
        viewModel.presentValue = "1000"
        viewModel.periodicPayment = "0"
        viewModel.futureValue = "2000"

        viewModel.calculate()

        if case .invalidInput = viewModel.calculationResult {
            // Test passed
        } else {
            XCTFail("Expected invalidInput, but got \(viewModel.calculationResult)")
        }
    }
}
