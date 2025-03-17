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
            HelpView(helpData: compoundingPeriodsHelpData)
        }
    }
    
    let compoundingPeriodsHelpData = HelpData(
        title: "Help",
        description: "The Compounding Periods Calculator helps you determine the number of compounding periods required to reach a future value, based on the following inputs:",
        inputFields: [
            InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be applied to the investment."),
            InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) you are investing."),
            InputField(icon: "dollarsign.circle.fill", title: "Future Value", description: "Enter the future amount of money you want to achieve."),
            InputField(icon: "arrow.clockwise.circle", title: "Periodic Payment (Optional)", description: "Enter the amount of money you will add periodically (e.g., monthly or yearly) to the investment. If there are no periodic payments, you can leave this field blank or enter 0.")
        ],
        notes: [
            "Ensure all inputs are positive numbers.",
            "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
            "The calculator assumes that payments are made at the end of each period."
        ]
    )

}

#Preview {
    CalCompoundingPeriodsView()
}
