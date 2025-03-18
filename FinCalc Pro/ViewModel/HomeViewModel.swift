//
//  HomeViewModel.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-18.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let mainViews = Constant.MAIN_VIEWS
    
    func destinationView(for index: Int) -> some View {
        
        guard index >= 0 && index < mainViews.count else {
            return AnyView(Text("Unknown View"))
        }
        
        switch mainViews[index] {
        case Constant.SAVING_SCREEN_NAME:
            return AnyView(SavingView())
        case Constant.LOAN_SCREEN_NAME:
            return AnyView(LoanView())
        case Constant.MORTAGAGE_SCREEN_NAME:
            return AnyView(MortgageView())
        default:
            return AnyView(Text("Unknown View"))
        }
    }
    
    func iconName(for index: Int) -> String {
        
        guard index >= 0 && index < mainViews.count else {
            return "questionmark.circle.fill"
        }
        
        switch mainViews[index] {
        case Constant.SAVING_SCREEN_NAME:
            return "dollarsign.circle.fill"
        case Constant.LOAN_SCREEN_NAME:
            return "banknote.fill"
        case Constant.MORTAGAGE_SCREEN_NAME:
            return "house.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
}
