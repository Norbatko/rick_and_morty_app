//
//  episodes_list.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 12.02.2025.
//

import SwiftUI

struct EpisodeListView: View {
    @StateObject private var viewModel = EpisodeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.episodes ?? [], id: \.id) { episode in
                NavigationLink {
                    EpisodeDetailView(episode: episode)
                } label: {
                    EpisodeRow(episode: episode)
                }
            }
            .navigationTitle("Episodes")
            .onAppear {
                viewModel.fetchEpisodes()
            }
        }
    }
}
