import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                // First button at the top
                SquareButton(title: "Saving", size: geometry.size.width * 0.4)

                // Two buttons below
                HStack(spacing: 20) {
                    SquareButton(title: "Loan", size: geometry.size.width * 0.4)
                    SquareButton(title: "Mortgage", size: geometry.size.width * 0.4)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .padding()
    }
}

// Custom Button View
struct SquareButton: View {
    let title: String
    let size: CGFloat
    
    var body: some View {
        Button(action: {
            print("\(title) button tapped")
        }) {
            Text(title)
                .frame(width: size, height: size) // Square button with dynamic size
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
        }
    }
}

#Preview {
    HomeView()
}
