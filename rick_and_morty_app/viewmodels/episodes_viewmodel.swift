//
//  episodes_viewmodel.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 12.02.2025.
//

import Foundation

class EpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode]?

    func fetchEpisodes() {
        APIService.shared.fetchEpisodes { [weak self] episodes in
            DispatchQueue.main.async {
                self?.episodes = episodes
            }
        }
    }
}
