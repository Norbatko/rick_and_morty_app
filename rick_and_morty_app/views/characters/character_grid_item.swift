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
            ZStack(alignment: .bottom) {
                // Character Image
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Fill frame while keeping aspect ratio
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 160, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 4)
                
                // Gradient Overlay for Better Text Readability
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .center
                )
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // Character Name
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, 8)
            }
            .frame(width: 160, height: 200)
        }
}
