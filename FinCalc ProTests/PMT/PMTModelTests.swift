//
//  PMTModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro

class PMTModelTests: XCTestCase {

    // MARK: - Test Valid Inputs

    func testCalculatePMTWithValidInputs() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 1000,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -288.51, accuracy: 0.01, "PMT calculation with valid inputs is incorrect")
    }

    // MARK: - Test Edge Cases

    func testCalculatePMTWithZeroInterest() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 0,
            presentValue: 1000,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -300.00, accuracy: 0.01, "PMT calculation with zero interest is incorrect")
    }

    func testCalculatePMTWithZeroNumberOfPeriods() {
        let model = PMTModel(
            numberOfPeriods: 0,
            interestPerYear: 5,
            presentValue: 1000,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertTrue(pmt!.isNaN || pmt!.isInfinite, "PMT calculation with zero periods should return NaN or infinity")
    }

    func testCalculatePMTWithZeroPresentValue() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 0,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -159.00, accuracy: 0.01, "PMT calculation with zero present value is incorrect")
    }

    func testCalculatePMTWithZeroFutureValue() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 1000,
            futureValue: 0
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -129.50, accuracy: 0.01, "PMT calculation with zero future value is incorrect")
    }

    func testCalculatePMTWithNegativePresentValue() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: -1000,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -29.50, accuracy: 0.01, "PMT calculation with negative present value is incorrect")
    }

    func testCalculatePMTWithNegativeFutureValue() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: 5,
            presentValue: 1000,
            futureValue: -2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, 29.50, accuracy: 0.01, "PMT calculation with negative future value is incorrect")
    }

    func testCalculatePMTWithNegativeInterest() {
        let model = PMTModel(
            numberOfPeriods: 10,
            interestPerYear: -5,
            presentValue: 1000,
            futureValue: 2000
        )
        
        let pmt = model.calPmt()
        XCTAssertNotNil(pmt, "PMT calculation with valid inputs is incorrect")
        XCTAssertEqual(pmt!, -323.82, accuracy: 0.01, "PMT calculation with negative interest is incorrect")
    }
}
