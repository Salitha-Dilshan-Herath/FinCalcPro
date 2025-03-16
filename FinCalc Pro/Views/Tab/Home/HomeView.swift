import SwiftUI

struct HomeView: View {
        
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(Constant.MAIN_VIEWS.indices, id: \.self) { index in
                        NavigationLink(destination: destinationView(for: Constant.MAIN_VIEWS[index])) {
                            HStack {
                                Text(Constant.MAIN_VIEWS[index])
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
            }.navigationTitle(Constant.HOME_SCREEN_TITLE)
        }
    }
    
    @ViewBuilder
    private func destinationView(for item: String) -> some View {
        switch item {
        case Constant.SAVING_SCREEN_NAME:
            SavingView()
        case Constant.LOAN_SCREEN_NAME:
            LoanView()
        case Constant.MORTAGAGE_SCREEN_NAME:
            MortgageView()
        default:
            Text("Unknown View") // Fallback in case of an unknown item
        }
    }
    
    
}


#Preview {
    HomeView()
}
