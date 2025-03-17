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
                    Label(Constant.HOME_SCREEN_TITLE, systemImage: "house.fill")
                }
            AboutView()
                .tabItem {
                    Label(Constant.ABOUT_SCRREN_TITLE, systemImage: "questionmark.circle.fill")
                }
        }.backgroundStyle(Color.white)
    }
}

#Preview {
    MainTabView()
}
