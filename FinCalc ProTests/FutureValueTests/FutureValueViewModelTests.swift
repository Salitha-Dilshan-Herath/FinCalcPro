//
//  FutureValueViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro

class FutureValueViewModelTests: XCTestCase {

    var viewModel: FutureValueViewModel!

    override func setUp() {
        super.setUp()
        viewModel = FutureValueViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testCalculateValidInput() {
        viewModel.numberOfPeriods = "10"
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        
        viewModel.calculate()
        
        if case .valid(let result) = viewModel.calculationResult {
            XCTAssertGreaterThan(result, 0) // Expect a positive future value
        } else {
            XCTFail("Expected a valid result")
        }
    }

    func testCalculateInvalidInput() {
        viewModel.numberOfPeriods = "abc" // Invalid number
        viewModel.interestPerYear = "5"
        viewModel.presentValue = "1000"
        viewModel.periodicPayment = "100"
        
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
    }

    func testFormatNumber() {
        let formatted = viewModel.formatNumber(1234567.89)
        XCTAssertEqual(formatted, "1,234,567.89")
    }
}
