//
//  epidoses_row.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 12.02.2025.
//

import SwiftUI

struct EpisodeRow: View {
    let episode: Episode

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(episode.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(episode.episode)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Aired on: \(episode.air_date)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()

            Image(systemName: "tv.fill")
                .foregroundColor(.blue)
                .font(.title2)
        }
        .padding(.vertical, 8)
    }
}
