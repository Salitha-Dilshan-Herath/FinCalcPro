
//
//  Untitled.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest

@testable import FinCalc_Pro

class FutureValueModelTests: XCTestCase {
    
    func testFutureValueWithPeriodicPayment() {
        let model = FutureValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: 100)
        let result = model.calculateFutureValue()
        
        // Expected value calculated manually or using a financial calculator
        let expected = -(1000 * pow(1.05, 10) + 100 * ((pow(1.05, 10) - 1) / 0.05))
        XCTAssertEqual(result, expected, accuracy: 0.01)
    }
    
    func testZeroPeriods() {
        let model = FutureValueModel(numberOfPeriods: 0, interestPerYear: 5, presentValue: 1000, periodicPayment: 100)
        let result = model.calculateFutureValue()
        
        XCTAssertEqual(result, -1000, accuracy: 0.01) // Should return the present value
    }
    
    func testFutureValueWithZeroInterest() {
        let model = FutureValueModel(
            numberOfPeriods: 10,
            interestPerYear: 0,
            presentValue: 1000,
            periodicPayment: 100
        )
        
        let futureValue = model.calculateFutureValue()
        XCTAssertEqual(futureValue, -2000.00, accuracy: 0.01, "Future value with zero interest is incorrect")
    }
    
    func testFutureValueWithZeroPeriods() {
        let model = FutureValueModel(
            numberOfPeriods: 0,
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: 100
        )
        
        let futureValue = model.calculateFutureValue()
        XCTAssertEqual(futureValue, -1000.00, accuracy: 0.01, "Future value with zero periods is incorrect")
    }
    
    func testFutureValueWithNegativePresentValue() {
        let model = FutureValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: -1000,
            periodicPayment: 100
        )
        
        let futureValue = model.calculateFutureValue()
        XCTAssertEqual(futureValue, 371.10, accuracy: 0.01, "Future value with negative present value is incorrect")
    }
    
    func testFutureValueWithNegativePeriodicPayment() {
        let model = FutureValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: -100
        )
        
        let futureValue = model.calculateFutureValue()
        XCTAssertEqual(futureValue, -371.10, accuracy: 0.01, "Future value with negative periodic payment is incorrect")
    }
}
