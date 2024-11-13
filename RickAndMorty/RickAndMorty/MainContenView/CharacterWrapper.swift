import RickMortySwiftApi
import Foundation

struct CharacterWrapper: Identifiable, Equatable {
    let id: Int
    let character: RMCharacterModel
    
    static func == (lhs: CharacterWrapper, rhs: CharacterWrapper) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(character: RMCharacterModel) {
        self.character = character
        self.id = character.id  
    }
}
