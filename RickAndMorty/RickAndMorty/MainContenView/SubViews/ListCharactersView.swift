import SwiftUI

struct ListCharactersView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading && viewModel.characters.isEmpty {
                ProgressView()
            }
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(Array(viewModel.characters.enumerated()), id: \.offset) { index, character in
                        CharacterCellView(character: character.character)
                            .onAppear {
                                if index == viewModel.characters.count - 1 {
                                    viewModel.loadMoreCharacters()
                                }
                            }
                    }
                }
            }
        }
    }
}
