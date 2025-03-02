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
                    NavigationLink(destination: destinationView(for: index)) {
                        
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
                        .opacity(isVisible ? 1 : 0)
                        .offset(y: isVisible ? 0 : 50)
                        .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: isVisible)
                        
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Saving")
        .onAppear {
            isVisible = true
        }
    }
    
    @ViewBuilder
    private func destinationView(for item: Int) -> some View {
        switch item {
        case 0:
            CalFutureValueView()
        case 1:
            CalFutureValueView()
        case 2:
            CalFutureValueView()
        default:
            Text("Unknown View") // Fallback in case of an unknown item
        }
    }
}


#Preview {
    SavingView()
}
