import SwiftUI
import RickMortySwiftApi

struct MainContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                   
                ListCharactersView(viewModel: viewModel)
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    MainContentView()
}
