import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.mainViews.indices, id: \.self) { index in
                        homeNavigationLink(for: index)
                    }
                }
                .padding()
            }
            .navigationTitle(Constant.HOME_SCREEN_TITLE)
            .onAppear {
            }
        }
    }

    private func homeNavigationLink(for index: Int) -> some View {
        NavigationLink(destination: viewModel.destinationView(for: index)) {
            HStack {
                Image(systemName: viewModel.iconName(for: index))
                    .font(.title2)
                    .foregroundColor(.blue)
                    .frame(width: 30, height: 30)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                
                Text(viewModel.mainViews[index])
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.forward")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(height: 80) 
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

#Preview {
    HomeView()
}
