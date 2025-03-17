//
//  HelpModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

// Data Model
struct HelpData {
    let title: String
    let description: String
    let inputFields: [InputField]
    let notes: [String]
}

struct InputField {
    let icon: String
    let title: String
    let description: String
}

