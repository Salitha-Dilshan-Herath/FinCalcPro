//
//  TabView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-02.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            HelpView()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle.fill")
                }
        }.backgroundStyle(Color.white)
    }
}

#Preview {
    MainTabView()
}
