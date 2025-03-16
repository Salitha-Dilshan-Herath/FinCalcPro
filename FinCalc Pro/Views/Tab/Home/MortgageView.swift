//
//  MortgageView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import SwiftUI

struct MortgageView: View {
    @ObservedObject var viewModel = MortgageViewModel()
    @State private var showAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("Financial Inputs")) {
                
                HStack {
                    Text("House Price")
                    Spacer()
                    HStack(alignment: .firstTextBaseline){
                        Text("Rs")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            if viewModel.housePrice.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $viewModel.housePrice)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                
                HStack {
                    Text("Down Payment")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {

                        Text("Rs")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.downPayment)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            if viewModel.downPayment.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Monthly Payment")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {

                        Text("Rs")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.monthlyPayment)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            if viewModel.monthlyPayment.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Loan Term")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {

                        Text("year")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.loanTerm)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            if viewModel.loanTerm.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Interest Rate")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {
                        Text("%")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            TextField("", text: $viewModel.interestRate)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            
                            if viewModel.interestRate.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            
            Button(action: {
                viewModel.calculate()
                if !viewModel.errorMessage.isEmpty {
                    showAlert = true
                }
            }) {
                Text("Calculate")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Loan Calculator")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid Input"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK")))
        }.toolbar {
            // Reset Button
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.resetForm()
                }) {
                    Image(systemName: "arrow.clockwise.circle")
                }
            }
            
            // Help Button
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.resetForm()
                }) {
                    Image(systemName: "questionmark.circle")
        
                }
            }
        }
    }
}

#Preview {
    MortgageView()
}
