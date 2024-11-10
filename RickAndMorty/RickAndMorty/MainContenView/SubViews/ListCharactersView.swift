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
                }
            }
        }
    }
}
