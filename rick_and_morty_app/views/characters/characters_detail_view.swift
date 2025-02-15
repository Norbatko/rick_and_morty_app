//
//  characters_detail_screen.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 15.02.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    // Character Image (Fills the top portion of the screen)
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.7) // Fills half the screen
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    }
                    
                    // Character Info (Below the image)
                    VStack(alignment: .leading, spacing: 15) {
                        Text(character.name)
                            .font(.largeTitle)
                            .bold()
                        
                        HStack {
                            Text("Species: \(character.species)")
                            Spacer()
                            Text("Status: \(character.status)")
                                .foregroundColor(character.status == "Alive" ? .green : .red)
                        }
                        .font(.headline)
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Origin: \(character.origin.name)")
                            Text("Location: \(character.location.name)")
                            Text("Gender: \(character.gender)")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    .padding(.top, -30) // Slight overlap effect
                }
            }
        }
        .edgesIgnoringSafeArea(.top) // Allows the image to extend to the top
        .background(Color(UIColor.systemBackground))
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
