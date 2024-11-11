import SwiftUI
import RickMortySwiftApi
import Kingfisher

struct CharacterPageView: View {
    let character: RMCharacterModel
    
    var body: some View {
        VStack {
            CustomNavigationBar()
            
            ScrollView(.vertical) {
                CharacterHeaderView(character: character)
                
                CharacterDetailView(character: character)
                
                EpisodesView(character: character)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

extension String {
    var episodeNumber: String {
        return URL(string: self)?.lastPathComponent ?? "Unknown"
    }
}

extension String {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = formatter.date(from: self) {
            formatter.dateFormat = "dd MMMM yyyy"
            return formatter.string(from: date)
        }
        
        return "Invalid date"
    }
}
