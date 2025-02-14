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
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Fills the frame while maintaining aspect ratio
            } placeholder: {
                ProgressView() // Show loading indicator while the image is loading
            }
            .frame(width: 150, height: 150) // Set a fixed size
            .clipShape(RoundedRectangle(cornerRadius: 10)) // Clip to a rounded rectangle
            .clipped() // Prevents overflowing parts of the image

            Text(character.name)
                .font(.caption)
                .bold()
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .frame(width: 150, height: 180) // Give extra height for the text
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
