//
//  CalCompoundingPeriodsView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-14.
//

import SwiftUI

struct CalCompoundingPeriodsView: View {
    @ObservedObject var viewModel = CompoundingPeriodsViewModel()
    @State private var showAlert = false
    @State private var isHelpSheetPresented = false

    var body: some View {
        Form {
            Section(header: Text("Financial Inputs")) {
                HStack {
                    Text("Interest Rate")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        Text("%")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.interestPerYear)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            if viewModel.interestPerYear.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
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
                    HStack(alignment: .firstTextBaseline){
                        Text("Rs")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            if viewModel.periodicPayment.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $viewModel.periodicPayment)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
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
                        Text("Compounding Periods (N) = \(result)")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        
                    }
                }
            }
        }
        .navigationTitle("Compounding Periods Calculator")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text("Please enter valid numbers for all fields."),
                dismissButton: .default(Text("OK")))
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isHelpSheetPresented = true
                }) {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.blue)
                }
            }
        }
        .sheet(isPresented: $isHelpSheetPresented) {
            HelpView(helpData: Constant.COMPOUNDING_PERIODS_HELP_DATA)
        }
    }
}

#Preview {
    CalCompoundingPeriodsView()
}
