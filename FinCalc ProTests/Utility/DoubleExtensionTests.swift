//
//  DoubleExtensionTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import XCTest
@testable import FinCalc_Pro


class DoubleExtensionTests: XCTestCase {

    func testFormattedWithSeparator() {
        // Test cases
        let testCases: [(Double, String)] = [
            (1234.56, "1,234.56"),
            (1234567.89, "1,234,567.89"),
            (1234, "1,234.00"),
            (0.456, "0.46"),
            (1000000, "1,000,000.00"),
            (0, "0.00"),
            (-1234.56, "-1,234.56")
        ]
        
        // Iterate through test cases
        for (input, expected) in testCases {
            let result = input.formattedWithSeparator()
            XCTAssertEqual(result, expected, "Expected \(expected) but got \(result) for input \(input)")
        }
    }
}
