//
//  HelpFutureView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import SwiftUI

struct HelpFutureView: View {
    var body: some View {
           ScrollView {
               VStack(alignment: .leading, spacing: 20) {
                   // Title
                   Text("Help")
                       .font(.largeTitle)
                       .bold()
                       .foregroundColor(.blue)
                       .padding(.bottom, 10)
                   
                   // Description
                   Text("The Future Value Calculator helps you determine the future value of an investment based on the following inputs:")
                       .font(.body)
                       .foregroundColor(.secondary)
                   
                   // Input Fields Section
                   VStack(alignment: .leading, spacing: 15) {
                       // Number of Periods
                       InputCard(
                           icon: "calendar",
                           title: "Number of Periods",
                           description: "Enter the total number of periods (e.g., months, years) over which the investment will grow."
                       )
                       
                       // Interest Per Year
                       InputCard(
                           icon: "percent",
                           title: "Interest Per Year",
                           description: "Enter the annual interest rate (in percentage) that will be applied to the investment."
                       )
                       
                       // Present Value
                       InputCard(
                           icon: "dollarsign.circle",
                           title: "Present Value",
                           description: "Enter the initial amount of money (present value) you are investing."
                       )
                       
                       // Periodic Payment (Optional)
                       InputCard(
                           icon: "arrow.clockwise.circle",
                           title: "Periodic Payment (Optional)",
                           description: "Enter the amount of money you will add periodically (e.g., monthly or yearly) to the investment. If there are no periodic payments, you can enter 0."
                       )
                   }
                   
                   // Notes Section
                   VStack(alignment: .leading, spacing: 10) {
                       Text("Notes")
                           .font(.title2)
                           .bold()
                           .foregroundColor(.blue)
                           .padding(.top, 10)
                       
                       NoteItem(text: "Ensure all inputs are positive numbers.")
                       NoteItem(text: "The interest rate should be entered as a percentage (e.g., 5 for 5%).")
                       NoteItem(text: "The calculator assumes that payments are made at the end of each period.")
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

   // Reusable Input Card Component
   struct InputCard: View {
       var icon: String
       var title: String
       var description: String
       
       var body: some View {
           HStack(alignment: .top, spacing: 15) {
               Image(systemName: icon)
                   .font(.title2)
                   .foregroundColor(.blue)
                   .frame(width: 30, alignment: .center)
               
               VStack(alignment: .leading, spacing: 5) {
                   Text(title)
                       .font(.headline)
                       .bold()
                       .foregroundColor(.primary)
                   
                   Text(description)
                       .font(.body)
                       .foregroundColor(.secondary)
                       .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
               }
           }
           .padding()
           .frame(maxWidth: .infinity, alignment: .leading) 
           .background(Color(.systemBackground))
           .cornerRadius(10)
           .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
       }
   }

   // Reusable Note Item Component
   struct NoteItem: View {
       var text: String
       
       var body: some View {
           HStack(alignment: .top, spacing: 10) {
               Image(systemName: "circle.fill")
                   .font(.system(size: 6))
                   .foregroundColor(.blue)
                   .padding(.top, 8)
               
               Text(text)
                   .font(.body)
                   .foregroundColor(.secondary)
                   .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
           }
       }
   }

#Preview {
    HelpFutureView()
}
