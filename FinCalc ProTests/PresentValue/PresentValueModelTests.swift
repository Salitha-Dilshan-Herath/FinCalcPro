//
//  PresentValueModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro


class PresentValueModelTests: XCTestCase {

    func testPresentValueWithPeriodicPayment() {
        let model = PresentValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            futureValue: 1000,
            periodicPayment: 100
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, -1386.09, accuracy: 0.01, "Present value with periodic payment is incorrect")
    }

    func testPresentValueWithoutPeriodicPayment() {
        let model = PresentValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            futureValue: 1000,
            periodicPayment: 0
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, -613.91, accuracy: 0.01, "Present value without periodic payment is incorrect")
    }

    func testPresentValueWithZeroInterest() {
        let model = PresentValueModel(
            numberOfPeriods: 10,
            interestPerYear: 0,
            futureValue: 1000,
            periodicPayment: 100
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, -2000.00, accuracy: 0.01, "Present value with zero interest is incorrect")
    }

    func testPresentValueWithZeroPeriods() {
        let model = PresentValueModel(
            numberOfPeriods: 0,
            interestPerYear: 5,
            futureValue: 1000,
            periodicPayment: 100
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, -1000.00, accuracy: 0.01, "Present value with zero periods is incorrect")
    }

    func testPresentValueWithNegativeFutureValue() {
        let model = PresentValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            futureValue: -1000,
            periodicPayment: 100
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, -158.26, accuracy: 0.01, "Present value with negative future value is incorrect")
    }

    func testPresentValueWithNegativePeriodicPayment() {
        let model = PresentValueModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            futureValue: 1000,
            periodicPayment: -100
        )
        
        let presentValue = model.calculatePresentValue()
        XCTAssertEqual(presentValue, 158.26, accuracy: 0.01, "Present value with negative periodic payment is incorrect")
    }
}
