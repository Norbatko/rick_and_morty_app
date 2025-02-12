//
//  episode.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

struct EpisodeResponse: Codable {
    let info: Info
    let results: [Episode]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Episode: Identifiable, Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
