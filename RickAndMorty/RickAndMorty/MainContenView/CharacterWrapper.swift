import RickMortySwiftApi
import Foundation

struct CharacterWrapper: Equatable {
    let character: RMCharacterModel
    
    static func == (lhs: CharacterWrapper, rhs: CharacterWrapper) -> Bool {
        return lhs.character.id == rhs.character.id
    }
    
    init(character: RMCharacterModel) {
        self.character = character
    }
}
