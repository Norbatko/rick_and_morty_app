//
//  location.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

struct Location: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
