//
//  HelpView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import SwiftUI

struct HelpView: View {
    let helpData: HelpData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text(helpData.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
                
                // Description
                Text(helpData.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                // Input Fields Section
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(helpData.inputFields, id: \..title) { field in
                        InputCard(icon: field.icon, title: field.title, description: field.description)
                    }
                }
                
                // Notes Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Notes")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                    
                    ForEach(helpData.notes, id: \..self) { note in
                        NoteItem(text: note)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Help")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}


struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(helpData: HelpData(
            title: "Help",
            description: "The PMT (Periodic Payment) Calculator helps you determine the periodic payment required to achieve a future value or pay off a loan, based on the following inputs:",
            inputFields: [
                InputField(icon: "calendar", title: "Number of Periods", description: "Enter the total number of periods (e.g., months, years) over which the payments will be made."),
                InputField(icon: "percent", title: "Interest Per Year", description: "Enter the annual interest rate (in percentage) that will be applied to the loan or investment."),
                InputField(icon: "dollarsign.circle", title: "Present Value", description: "Enter the initial amount of money (present value) of the loan or investment."),
                InputField(icon: "dollarsign.circle.fill", title: "Future Value", description: "Enter the future amount of money you want to achieve. For loans, this is typically 0.")
            ],
            notes: [
                "Ensure all inputs are positive numbers.",
                "The interest rate should be entered as a percentage (e.g., 5 for 5%).",
                "The calculator assumes that payments are made at the end of each period."
            ]
        ))
    }
}
