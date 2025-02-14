//
//  episode_detail_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Episode Title
                Text(episode.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top)
                
                // Episode Meta Data (Air Date, Episode Number)
                HStack {
                    Text("Air Date: \(episode.air_date)")
                        .font(.subheadline)
                    Spacer()
                    Text("Episode #: \(episode.episode)")
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
                
                Divider() // Adds a line separator
                
                // Character List Title
                Text("Characters in this episode")
                    .font(.headline)
                    .padding(.top)
                
                // Character Images in a Grid
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        CharacterGridView(characters: episode.characters)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground)) // To ensure it adapts well in light/dark mode
    }
}
