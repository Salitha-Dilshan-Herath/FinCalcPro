import SwiftUI

struct HomeView: View {
    
    private let items = ["Saving", "Loan", "Mortgage"]
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(items.indices, id: \.self) { index in
                        NavigationLink(destination: destinationView(for: items[index])) { // Navigate to specific view
                            HStack {
                                Text(items[index])
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "chevron.forward") // Right-side arrow
                                    .font(.title3)
                            }
                            .padding()
                            .frame(height:80)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }.navigationTitle("Home")
        }
    }
    
    @ViewBuilder
    private func destinationView(for item: String) -> some View {
        switch item {
        case "Saving":
            SavingView()
        case "Loan":
            LoanView()
        case "Mortgage":
            SavingView()
        default:
            Text("Unknown View") // Fallback in case of an unknown item
        }
    }
    
    
}


#Preview {
    HomeView()
}
