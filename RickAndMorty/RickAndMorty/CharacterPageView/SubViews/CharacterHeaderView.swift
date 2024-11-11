import SwiftUI
import RickMortySwiftApi
import Kingfisher

struct CharacterHeaderView: View {
    let character: RMCharacterModel
    
    private var genderColor: Color {
        character.gender == "Male" ? Color.maleBlue : Color.femalePink
    }
    
    private var genderBackgroundColor: Color {
        genderColor.opacity(0.1)
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: character.image))
                .resizable()
                .scaledToFill()
                .cornerRadius(13)
                .frame(height: 343)
                .padding(.top, 10)
                .padding()
            
            HStack {
                Text(character.name)
                    .font(.system(size: 24, weight: .semibold))
                
                Spacer()
                
                Text(character.gender)
                    .font(.system(size: 14))
                    .foregroundColor(genderColor)
                    .padding(.vertical, 4)
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .foregroundColor(genderBackgroundColor)
                    )
            }
            .padding(.top, 8)
            .padding(.bottom)
            .padding(.horizontal)
        }
    }
}


