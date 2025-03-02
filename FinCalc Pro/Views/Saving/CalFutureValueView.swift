//
//  CalFutureValue.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import SwiftUI

struct CalFutureValueView: View {
    
    @ObservedObject var viewModel = FutureValueViewModel()
    @State private var showAlert = false // State to control alert visibility
    
    var body: some View {
        Form {
            Section(header: Text("Financial Inputs")) {
                HStack {
                    Text("Number of periods")
                    Spacer()
                    ZStack(alignment: .trailing) {
                        if viewModel.numberOfPeriods.isEmpty {
                            Text("0")
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $viewModel.numberOfPeriods)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                HStack {
                    Text("Interest per year")
                    Spacer()
                    ZStack(alignment: .trailing) {
                        // TextField for user input
                        TextField("", text: $viewModel.interestPerYear)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing, 20) // Add padding to avoid overlap with the % symbol
                        
                        // Placeholder text
                        if viewModel.interestPerYear.isEmpty {
                            Text("0")
                                .foregroundColor(.gray)
                                .padding(.trailing, 20) // Align placeholder with the TextField
                        }
                        
                        Text("%")
                            .foregroundColor(.gray)
                            .padding(.trailing, 0) // Adjust padding to align with the TextField
                    }
                }
                
                HStack {
                    Text("Present Value")
                    Spacer()
                    HStack(alignment: .firstTextBaseline){
                        Text("$")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            if viewModel.presentValue.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $viewModel.presentValue)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                }
                
                HStack {
                    Text("Periodic Payment")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        // $ symbol at the front
                        Text("$")
                            .foregroundColor(.gray)
                        
                        // TextField for user input
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.periodicPayment)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            // Placeholder text
                            if viewModel.periodicPayment.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            
            Button(action: {
                viewModel.calculate()
                if case .invalidInput = viewModel.calculationResult {
                    showAlert = true
                }
            }) {
                Text("Calculate")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            if case .valid(let result) = viewModel.calculationResult {
                Section {
                    HStack {
                        Text("Future Value = $\(viewModel.formatNumber(result))")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        
                    }
                }
            }
        }
        .navigationTitle("Future Value Calculator")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text("Please enter valid numbers for all fields."),
                dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    CalFutureValueView()
}
