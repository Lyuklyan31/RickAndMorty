import SwiftUI
import RickMortySwiftApi

struct MainContentView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)

                ListCharactersView(viewModel: viewModel)
            }
            .navigationTitle("Characters")
            .onChange(of: viewModel.alertMessage) {
                if viewModel.alertMessage != nil {
                    showingAlert = true
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.alertMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    MainContentView()
}
