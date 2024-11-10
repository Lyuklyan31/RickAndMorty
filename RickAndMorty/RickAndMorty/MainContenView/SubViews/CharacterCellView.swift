import SwiftUI
import Kingfisher
import RickMortySwiftApi

struct CharacterCellView: View {
    let character: RMCharacterModel
    
    var body: some View {
        NavigationLink {
            CharacterPageView(character: character)
        } label: {
            RoundedRectangle(cornerRadius: 13)
                .stroke(Color.roundRectangeleStroke, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 13).fill(Color.white))
                .frame(height: 115)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .overlay {
                    HStack {
                        KFImage(URL(string: character.image))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(13)
                            .frame(width: 99, height: 99)
                            .padding(.leading, 24)
                        
                        Text(character.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(8)
                        
                        Spacer()
                        
                        VStack {
                            Text(character.gender)
                                .font(.system(size: 11))
                                .foregroundColor(character.gender == "Male" ? Color.maleBlue : Color.femalePink)
                                .padding(.vertical, 4)
                                .padding(.horizontal)
                                .background(
                                    Capsule()
                                        .foregroundColor(character.gender == "Male" ? Color.maleBlue.opacity(0.1) : Color.femalePink.opacity(0.1))
                                )
                            
                            Spacer()
                        }
                        .padding(.top, 20)
                        .padding(.trailing, 32)
                        
                    }
                }
                .buttonStyle(.plain)
        }
    }
}
