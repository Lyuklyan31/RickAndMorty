import Foundation
import Combine
import RickMortySwiftApi

class MainViewModel: ObservableObject {
    private let rmClient = RMClient()
    
    @Published private(set) var characters = [RMCharacterModel]()
    @Published private(set) var alertMessage: String?
    @Published private(set) var isLoading = false
    
    private var currentPage = 1
    private let itemsPerPage = 6
    private var canLoadMorePages = true
    
    init() {
        Task {
            await fetchCharacters()
        }
    }
    
    func loadMoreCharacters() {
        Task {
            await fetchCharacters()
        }
    }
    
    @MainActor
    private func fetchCharacters() async {
        guard !isLoading && canLoadMorePages else { return }
        
        isLoading = true
        alertMessage = nil
        defer { isLoading = false }
        
        do {
            let result = try await rmClient.character().getCharactersByPageNumber(pageNumber: currentPage)
            if result.isEmpty {
                canLoadMorePages = false
            } else {
                characters.append(contentsOf: result)
                currentPage += 1
            }
        } catch {
            alertMessage = "Error fetching characters"
        }
    }
}

