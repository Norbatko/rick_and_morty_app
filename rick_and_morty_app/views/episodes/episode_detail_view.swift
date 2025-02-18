//
//  episode_detail_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    
    @StateObject private var viewModel = CharacterViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    var body: some View {
        VStack() {
            // Sticky Header Section
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("Air Date: \(episode.air_date)")
                        .font(.subheadline)
                    Spacer()
                    Text("Episode: \(episode.episode)")
                        .font(.subheadline)
                }
                .foregroundColor(.secondary)
            }
            .padding()
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Adds a subtle shadow
            
            Divider()

            Text("Characters in this episode").font(.headline)
            
            ScrollView {
                CharacterGridView(characters: episode.characters)
            }
        }
        .background(Color(.systemGroupedBackground))
        .onAppear {
            viewModel.fetchCharactersByIDs(characters: episode.characters)
        }
    }
}

#Preview {
    ContentView()
}
