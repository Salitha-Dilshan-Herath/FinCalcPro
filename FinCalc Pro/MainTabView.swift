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
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
