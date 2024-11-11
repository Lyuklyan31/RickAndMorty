import SwiftUI
import RickMortySwiftApi
import Kingfisher

struct ListCharactersView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.characters) { character in
                    CharacterCellView(character: character)
                        .onAppear {
                            if character == viewModel.characters.last {
                                viewModel.loadMoreCharacters()
                            }
                        }
                }
            }
        }
        
        if viewModel.characters.isEmpty {
            ProgressView()
        }
    }
}

extension RMCharacterModel: @retroactive Equatable {
    public static func == (lhs: RMCharacterModel, rhs: RMCharacterModel) -> Bool {
        return lhs.id == rhs.id
    }
}
