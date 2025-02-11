//
//  episode.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

struct Episode: Identifiable, Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: Int
    let characters: [String]
    let url: String
    let created: String
}
