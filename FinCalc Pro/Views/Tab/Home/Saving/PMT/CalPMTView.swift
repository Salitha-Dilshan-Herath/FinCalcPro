//
//  CalPMTView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-13.
//

import SwiftUI

struct CalPMTView: View {
    
    @ObservedObject var viewModel = PMTViewModel()
    @State private var showAlert = false
    @State private var isHelpSheetPresented = false

    var body: some View {
        Form {
            Section(header: Text(Constant.SECTION_TITLE)) {
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
                        Text(Constant.CURRENCY)
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
                        Text(Constant.CURRENCY)
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
                        Text("PMT = Rs\(result.formattedWithSeparator())")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        
                    }
                }
            }
        }
        .navigationTitle(Constant.PMT_SCREN_TITLE)
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(Constant.ERORR_ALERT_TITLE_INVALID_DATA),
                message: Text(Constant.ERROR_ALERT_MESSAGE_INVALID_DATA),
                dismissButton: .default(Text(Constant.ERROR_ALERT_BUTTON_TITLE_OK)))
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
            HelpView(helpData: Constant.PMT_HELP_DATA)
        }
    }
}

#Preview {
    CalPMTView()
}
