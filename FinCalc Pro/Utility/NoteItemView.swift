//
//  NoteItemView.swift
//  FinCalc Pro
//
//  Created by Spemai on 2025-03-17.
//

import SwiftUI

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
                .fixedSize(horizontal: false, vertical: true) 
        }
    }
}

#Preview {
    NoteItem(text: "")
}
