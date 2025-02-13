//
//  episode_response.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

struct EpisodeResponse: Codable {
    let info: Info
    let results: [Episode]
}
