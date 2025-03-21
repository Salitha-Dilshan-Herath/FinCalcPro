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
    @State private var isHelpSheetPresented = false

    var body: some View {
        Form {
            Section(header: Text(Constant.SECTION_TITLE)) {
                
                HStack {
                    Text("House Price")
                    Spacer()
                    HStack(alignment: .firstTextBaseline){
                        Text(Constant.CURRENCY)
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

                        Text(Constant.CURRENCY)
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
        .navigationTitle(Constant.MORTAGAGE_SCREEN_TITLE)
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(Constant.ERORR_ALERT_TITLE_INVALID_DATA),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text(Constant.ERROR_ALERT_BUTTON_TITLE_OK)))
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
            HelpView(helpData: Constant.MORTGAGE_HELP_DATA)
        }
    }
}

#Preview {
    MortgageView()
}
