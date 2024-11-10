import Foundation
import Combine
import RickMortySwiftApi

class MainViewModel: ObservableObject {
    
    private let rmClient = RMClient()
    private let descriptionService = DescriptionService()
    
    @Published private(set) var characters: [RMCharacterModel] = []
    @Published private(set) var alertMessage = ""
    
    init() {
        Task {
            await fetchCharacters()
        }
    }
    
    @MainActor
    func fetchCharacters() async {
        do {
            characters = try await rmClient.character().getAllCharacters()
        } catch {
            alertMessage = "Error fetching characters"
        }
    }
}
