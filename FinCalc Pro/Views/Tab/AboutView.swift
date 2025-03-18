//
//  HelpView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-09.
//

import SwiftUI

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    // App Logo and Name
                    VStack(spacing: 10) {
                        Image("ic-launch-screen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(20)
         
                    }
                    .padding(.top, 30)
                    
                    // App Description
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About FinCalc Pro")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text("FinCalc Pro is a powerful financial calculator designed to help you make informed decisions about loans, mortgages, investments, and more. With easy-to-use tools and accurate calculations, FinCalc Pro simplifies complex financial planning.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Developer Information
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Developed By")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 10) {
                            Image(systemName: "person.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Salith Herath")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text("A passionate developer building tools to simplify your life.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
    
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("About Us")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AboutView()
}
