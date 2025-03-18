//
//  HomeViewModelTests.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-18.
//

import XCTest
import SwiftUI
@testable import FinCalc_Pro

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testDestinationViewForSavingScreen() {
        let view = viewModel.destinationView(for: 0)
        XCTAssertTrue(type(of: view) == AnyView.self, "Expected AnyView type")
    }
    
    func testDestinationViewForLoanScreen() {
        let view = viewModel.destinationView(for: 1)
        XCTAssertTrue(type(of: view) == AnyView.self, "Expected AnyView type")
    }
    
    func testDestinationViewForMortgageScreen() {
        let view = viewModel.destinationView(for: 2)
        XCTAssertTrue(type(of: view) == AnyView.self, "Expected AnyView type")
    }
    
    func testDestinationViewForUnknownScreen() {
        let invalidIndex = viewModel.mainViews.count
        let view = viewModel.destinationView(for: invalidIndex)
        XCTAssertTrue(type(of: view) == AnyView.self, "Expected AnyView type for invalid index")
    }
    
    func testIconNameForSavingScreen() {
        let iconName = viewModel.iconName(for: 0)
        XCTAssertEqual(iconName, "dollarsign.circle.fill", "Expected icon name for Saving Screen")
    }
    
    func testIconNameForLoanScreen() {
        let iconName = viewModel.iconName(for: 1)
        XCTAssertEqual(iconName, "banknote.fill", "Expected icon name for Loan Screen")
    }
    
    func testIconNameForMortgageScreen() {
        let iconName = viewModel.iconName(for: 2)
        XCTAssertEqual(iconName, "house.fill", "Expected icon name for Mortgage Screen")
    }
    
    func testIconNameForUnknownScreen() {
        let invalidIndex = viewModel.mainViews.count
        let iconName = viewModel.iconName(for: invalidIndex)
        XCTAssertEqual(iconName, "questionmark.circle.fill", "Expected default icon name for invalid index")
    }
}
