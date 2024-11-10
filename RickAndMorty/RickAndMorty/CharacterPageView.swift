import SwiftUI
import RickMortySwiftApi

struct CharacterPageView: View {
    let character: RMCharacterModel
    var body: some View {
        
        Text(character.name)
            
    }
}

