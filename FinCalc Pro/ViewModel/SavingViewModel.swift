//
//  SavingViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-16.
//

import SwiftUI

class SavingViewModel: ObservableObject {
    @Published var isVisible = false
    let savingViews = Constant.SAVING_VIEWS // Fetch from Constants
    
    // Function to return the correct destination view
    @ViewBuilder
    func destinationView(for index: Int) -> some View {
        switch index {
        case 0: CalFutureValueView()
        case 1: CalPMTView()
        case 2: CalInterestRateView()
        case 3: CalCompoundingPeriodsView()
        case 4: CalPresentValueView()
        default: Text("Unknown View") // Fallback
        }
    }
}
