import SwiftUI

struct ListCharactersView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
          
            if viewModel.isLoading && viewModel.characters.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(viewModel.characters, id: \.id) { character in
                        CharacterCellView(character: character.character)
                            .onAppear {
                                if character == viewModel.characters.last {
                                    viewModel.loadMoreCharacters()
                                }
                            }
                    }
                }
            }
        }
    }
}
