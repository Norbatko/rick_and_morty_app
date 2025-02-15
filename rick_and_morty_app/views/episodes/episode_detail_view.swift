//
//  episode_detail_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    let characters: [String]
    
    @StateObject private var viewModel = CharacterViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    // Sticky Header Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text(episode.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.top)
                        
                        HStack {
                            Text("Air Date: \(episode.air_date)")
                                .font(.subheadline)
                            Spacer()
                            Text("Episode #: \(episode.episode)")
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        Text("Characters in this episode")
                            .font(.headline)
                    }
                    .padding()
                    .frame(width: geometry.size.width)
                    .background(Color(UIColor.systemBackground))
                    .zIndex(1)
                    
                    CharacterGridView(characters: episode.characters)
                }
            }
            .background(Color(UIColor.systemBackground))
        }
        .onAppear {
            viewModel.fetchCharactersByIDs(characters: characters)
        }
    }
}
