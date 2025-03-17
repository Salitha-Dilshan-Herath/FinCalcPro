//
//  NumberFormatter+Extensions.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//
import Foundation

extension Double {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2 
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
