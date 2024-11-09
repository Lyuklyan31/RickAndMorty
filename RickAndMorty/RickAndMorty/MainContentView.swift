import SwiftUI
import RickMortySwiftApi

struct ContentView: View {
    let rmClient = RMClient()
    @State var characters: [RMCharacterModel] = []
    var body: some View {
        NavigationView {
            List(characters) { character in
                Text(character.name)
            }
            .task {
                do {
                    characters = try await rmClient.character().getAllCharacters()
                } catch (let error) {
                    print(error)
                }
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    ContentView()
}
