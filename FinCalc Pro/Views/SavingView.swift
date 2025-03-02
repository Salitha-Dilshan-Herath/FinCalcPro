//
//  SavingView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-02.
//

import SwiftUI


struct SavingView: View {
    @State private var isVisible = false
    private let items = ["Calculate Future Value", "Calculate Periodic Value", "Calculate Interest Rate", "Calculate Compounding Periods", "Calculate Present Value"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Text(items[index]) // Text
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "chevron.forward")
                            .font(.title3)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                    .opacity(isVisible ? 1 : 0) // Fade in
                    .offset(y: isVisible ? 0 : 50) // Slide from bottom to top
                    .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: isVisible)
                }
            }
            .padding()
        }
        .navigationTitle("Saving")
        .onAppear {
            isVisible = true
        }
    }
}


#Preview {
    SavingView()
}
