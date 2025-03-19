//
//  LoanView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-15.
//

import SwiftUI

struct LoanView: View {
    @ObservedObject var viewModel = LoanViewModel()
    @State private var showAlert = false
    @State private var isHelpSheetPresented = false

    var body: some View {
        Form {
            Section(header: Text("Financial Inputs")) {
                
                HStack {
                    Text("Loan Amount")
                    Spacer()
                    HStack(alignment: .firstTextBaseline){
                        Text(Constant.CURRENCY)
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .trailing) {
                            if viewModel.loanAmount.isEmpty {
                                Text("0")
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $viewModel.loanAmount)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                
                HStack {
                    Text("Loan Term")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {

                        Text("month")
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
                    Text("Monthly Payment")
                    Spacer()
                    HStack(alignment: .firstTextBaseline) {

                        Text(Constant.CURRENCY)
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
        .navigationTitle(Constant.LOAN_SCREEN_TITLE)
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
                    isHelpSheetPresented = true
                }) {
                    Image(systemName: "questionmark.circle")
        
                }
            }
        }.sheet(isPresented: $isHelpSheetPresented) {
            HelpView(helpData: Constant.LOAN_HELP_DATA)
        }
    }
    
    
}

#Preview {
    LoanView()
}
