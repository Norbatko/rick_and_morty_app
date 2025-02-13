//
//  character_grid_item.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct CharacterGridItem: View {
    let character: Character

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image))
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    Text(character.name)
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.black.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 5)),
                    alignment: .bottom
                )
        }
        .frame(width: 150, height: 150)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
