//
//  CompoundingPeriodsModalTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import XCTest
@testable import FinCalc_Pro

class CompoundingPeriodsModalTests: XCTestCase {

    // MARK: - Test Cases with Periodic Payments
    func testCalculateNumberOfPeriodsWithPeriodicPayment() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 5,
            presentValue: -1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with periodic payment failed")

    }

    func testCalculateNumberOfPeriodsWithPeriodicPaymentAndZeroInterest() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 0,
            presentValue: -1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with zero interest should fail")
    }

    // MARK: - Test Cases without Periodic Payments

    func testCalculateNumberOfPeriodsWithoutPeriodicPayment() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: nil,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNotNil(numberOfPeriods, "Number of periods calculation without periodic payment failed")
        XCTAssertEqual(numberOfPeriods!, 14.21, accuracy: 0.01, "Number of periods without periodic payment is incorrect")
    }

    func testCalculateNumberOfPeriodsWithoutPeriodicPaymentAndZeroPresentValue() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 5,
            presentValue: 0,
            periodicPayment: nil,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with zero present value should fail")
    }

    func testCalculateNumberOfPeriodsWithoutPeriodicPaymentAndZeroFutureValue() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: nil,
            futureValue: 0
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with zero future value should fail")
    }

    func testCalculateNumberOfPeriodsWithoutPeriodicPaymentAndOppositeSigns() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 5,
            presentValue: 1000,
            periodicPayment: nil,
            futureValue: -2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with opposite signs should fail")
    }

    // MARK: - Test Edge Cases

    func testCalculateNumberOfPeriodsWithZeroInterestAndPeriodicPayment() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 0,
            presentValue: -1000,
            periodicPayment: 100,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNil(numberOfPeriods, "Number of periods calculation with zero interest and periodic payment should fail")
    }

    func testCalculateNumberOfPeriodsWithNegativeInterest() {
        let model = CompoundingPeriodsModal(
            interestPerYear: -5,
            presentValue: 1000,
            periodicPayment: nil,
            futureValue: 2000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNotNil(numberOfPeriods, "Number of periods calculation with negative interest failed")
        XCTAssertEqual(numberOfPeriods!, -13.51, accuracy: 0.01, "Number of periods with negative interest is incorrect")
    }
    
    func testCalculateNumberOfPeriodsWithZeroPeriodicPayment() {
        let model = CompoundingPeriodsModal(
            interestPerYear: 4,
            presentValue: 100000,
            periodicPayment: 0,
            futureValue: 300000
        )
        
        let numberOfPeriods = model.calculateNumberOfPeriods()
        XCTAssertNotNil(numberOfPeriods, "Number of periods calculation with negative interest failed")
        XCTAssertEqual(numberOfPeriods!, 28.01, accuracy: 0.01, "Number of periods with negative interest is incorrect")
    }
}
