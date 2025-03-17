
//
//  Untitled.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro

class InterestRateModelTests: XCTestCase {

    // MARK: - Test Cases with Periodic Payments

    func testCalculateInterestRateWithPeriodicPayment() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: -1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with periodic payment failed")
    }

    func testCalculateInterestRateWithPeriodicPaymentAndZeroPresentValue() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: 0,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with periodic payment failed")

    }

    // MARK: - Test Cases without Periodic Payments
    func testCalculateInterestRateWithoutPeriodicPayment() {
        let model = InterestRateModel(
            numberOfPeriods: 5,
            presentValue: 100000,
            periodicPayment: 0,
            futureValue: 300000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNotNil(interestRate, "Interest rate calculation without periodic payment failed")
        XCTAssertEqual(interestRate!, 24.57, accuracy: 0.01, "Interest rate without periodic payment is incorrect")
    }

    func testCalculateInterestRateWithoutPeriodicPaymentAndZeroPresentValue() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: 0,
            periodicPayment: 0,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with zero present value and no periodic payment should fail")
    }

    // MARK: - Edge Cases

    func testCalculateInterestRateWithZeroPeriods() {
        let model = InterestRateModel(
            numberOfPeriods: 0,
            presentValue: 1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with zero periods should fail")
    }

    func testCalculateInterestRateWithNegativeFutureValue() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: 1000,
            periodicPayment: 100,
            futureValue: -2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with negative future value failed")
    
    }

    func testCalculateInterestRateWithNegativePresentValue() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: -1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with negative present value failed")
    }

    func testCalculateInterestRateWithNegativePeriodicPayment() {
        let model = InterestRateModel(
            numberOfPeriods: 10,
            presentValue: 1000,
            periodicPayment: -100,
            futureValue: 2000
        )
        
        let interestRate = model.calculateInterestRate()
        XCTAssertNil(interestRate, "Interest rate calculation with negative periodic payment failed")
    }
}
