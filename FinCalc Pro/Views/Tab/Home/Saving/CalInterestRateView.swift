//
//  CalInterestRateView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import SwiftUI

struct CalInterestRateView: View {
    @ObservedObject var viewModel = InterestRateViewModel()
    @State private var showAlert = false
    
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
                    Text("Present Value")
                    Spacer()
                    HStack(alignment: .firstTextBaseline){
                        Text("Rs")
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
                    Text("Future Value")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        // $ symbol at the front
                        Text("Rs")
                            .foregroundColor(.gray)
                        
                        // TextField for user input
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.futureValue)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            // Placeholder text
                            if viewModel.futureValue.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Periodic Payment")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        // $ symbol at the front
                        Text("Rs")
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
                        Text("Interest Rate = \(result)%")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        
                    }
                }
            }
        }
        .navigationTitle("Interest Rate Calculator")
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
    CalInterestRateView()
}
