//
//  SavingView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-02.
//

import SwiftUI

struct SavingView: View {
    @StateObject private var viewModel = SavingViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.savingViews.indices, id: \.self) { index in
                    savingNavigationLink(for: index)
                        .opacity(viewModel.isVisible ? 1 : 0)
                        .offset(y: viewModel.isVisible ? 0 : 50)
                        .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: viewModel.isVisible)
                }
            }
            .padding()
        }
        .navigationTitle(Constant.SAVING_SCREEN_NAME)
        .onAppear {
            viewModel.isVisible = true
        }
    }

    private func savingNavigationLink(for index: Int) -> some View {
        NavigationLink(destination: viewModel.destinationView(for: index)) {
            HStack {
                Text(viewModel.savingViews[index])
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.forward")
                    .font(.title3)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

#Preview {
    SavingView()
}

