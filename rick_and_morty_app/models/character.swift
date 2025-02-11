//
//  character.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
