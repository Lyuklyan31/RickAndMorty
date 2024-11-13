import SwiftUI
import RickMortySwiftApi

struct CharacterPageView: View {
    let character: RMCharacterModel
    
    var body: some View {
        VStack {
            CustomNavigationBar()
            
            ScrollView(.vertical) {
                CharacterHeaderView(character: character)
                
                CharacterDetailView(character: character)
                
                CharacterEpisodesView(character: character)
            }
            .navigationBarBackButtonHidden()
        }
    }
}
