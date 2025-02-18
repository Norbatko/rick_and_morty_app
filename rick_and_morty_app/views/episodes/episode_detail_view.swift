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
    @State private var rating: Int = 0
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    func loadRating() {
        if let savedRating = RatingStorage.loadRating(for: episode.id) {
            rating = savedRating
        }
    }
        
    // Save the rating when it changes
    func saveRating() {
        RatingStorage.saveRating(for: episode.id, rating: rating)
    }
    
    var body: some View {
        VStack() {
            // Sticky Header Section
            VStack(alignment: .leading) {
                HStack {
                    Text(episode.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Spacer()
                    StarRatingView(rating: $rating)
                        .onChange(of: rating) { _, _ in
                        saveRating()  // Save the rating whenever it changes
                    }
                }
                
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
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            
            Divider()

            Text("Characters in this episode").font(.headline)
            
            ScrollView {
                CharacterGridView(characters: episode.characters)
            }
        }
        .background(Color(.systemGroupedBackground))
        .onAppear {
            viewModel.fetchCharactersByIDs(characters: episode.characters)
            loadRating()
        }
    }
}

#Preview {
    ContentView()
}
