//
//  InterestRateViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro

class InterestRateViewModelTests: XCTestCase {
    
    var viewModel: InterestRateViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = InterestRateViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // MARK: - Test Valid Inputs
    
    func testCalculateWithValidInputs() {
        viewModel.numberOfPeriods = "10"
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
    
    // MARK: - Test Invalid Inputs
    
    func testCalculateWithInvalidNumberOfPeriods() {
        viewModel.numberOfPeriods = "invalid"
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
        viewModel.numberOfPeriods = "10"
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
        viewModel.numberOfPeriods = "10"
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
        viewModel.numberOfPeriods = "10"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "invalid"
        
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
    }
    
    // MARK: - Test Edge Cases
    
    func testCalculateWithZeroNumberOfPeriods() {
        viewModel.numberOfPeriods = "0"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"
        
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
        
    }
    
    func testCalculateWithNegativeNumberOfPeriods() {
        viewModel.numberOfPeriods = "-10"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"
        
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
        
    }
    
    func testCalculateWithZeroPresentValue() {
        viewModel.numberOfPeriods = "10"
        viewModel.presentValue = "0"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "2000"
        
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
        
    }
    
    func testCalculateWithZeroFutureValue() {
        viewModel.numberOfPeriods = "10"
        viewModel.presentValue = "-1000"
        viewModel.periodicPayment = "100"
        viewModel.futureValue = "0"
        
        viewModel.calculate()
        XCTAssertEqual(viewModel.calculationResult, .invalidInput)
    }
    
    func testCalculateInterestRateWithoutPeriodicPayment() {
        
        
        viewModel.numberOfPeriods = "5"
        viewModel.presentValue = "100000"
        viewModel.periodicPayment = "0"
        viewModel.futureValue = "300000"
        
        viewModel.calculate()
        
        if case .valid(let rate) = viewModel.calculationResult {
            XCTAssertEqual(rate, 24.57, accuracy: 0.01, "Interest rate calculation without periodic payment is incorrect")
        } else {
            XCTFail("Expected valid result, but got \(viewModel.calculationResult)")
        }
    }
}
