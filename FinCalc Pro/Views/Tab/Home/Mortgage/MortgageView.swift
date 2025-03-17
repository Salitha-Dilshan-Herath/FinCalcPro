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
        .navigationTitle("Mortgage Calculator")
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
            HelpView(helpData: mortgageHelpData)
        }
    }
    
    let mortgageHelpData = HelpData(
        title: "Mortgage Calculator Help",
        description: "The Mortgage Calculator helps you determine the missing value in a mortgage calculation (House Price, Down Payment, Monthly Payment, Loan Term, or Interest Rate) based on the following inputs:",
        inputFields: [
            InputField(icon: "house.fill", title: "House Price", description: "Enter the total price of the house (in Rs)."),
            InputField(icon: "dollarsign.circle", title: "Down Payment", description: "Enter the amount you will pay upfront (in Rs)."),
            InputField(icon: "arrow.clockwise.circle", title: "Monthly Payment", description: "Enter the amount you will pay each month (in Rs)."),
            InputField(icon: "calendar", title: "Loan Term", description: "Enter the total duration of the loan (in years)."),
            InputField(icon: "percent", title: "Interest Rate", description: "Enter the annual interest rate (in percentage) for the mortgage.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "To calculate the missing value, enter four fields and leave one blank."
        ]
    )

}

#Preview {
    MortgageView()
}
