import SwiftUI
import RickMortySwiftApi

struct CharacterEpisodesView: View {
    var character: RMCharacterModel
    
    var body: some View {
        VStack {
            Text("Episodes")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                ForEach(character.episode, id: \.self) { episode in
                    Text("Episode \(episode.getEpisodeNumber)")
                        .font(.system(size: 16))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}
