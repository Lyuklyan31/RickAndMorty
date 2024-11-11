//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Mac on 11.11.2024.
//

import SwiftUI
import RickMortySwiftApi

struct CharacterDetailView: View {
    var character: RMCharacterModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                detailText(title: "Species: ", value: character.species)
                detailText(title: "Status: ", value: character.status)
                detailText(title: "Location: ", value: character.location.name)
                detailText(title: "Data Created: ", value: character.created.formattedDate())
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    private func detailText(title: String, value: String) -> Text {
        Text(title).font(.system(size: 16, weight: .semibold)) +
        Text(value).font(.system(size: 16, weight: .regular)).foregroundColor(.greyForFont)
    }
}
