//
//  CalculationResult.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

enum CalculationResult: Equatable{
    case valid(Double) // Valid result with a calculated value
    case invalidInput // Invalid input state
    case empty // No calculation has been performed yet
}
