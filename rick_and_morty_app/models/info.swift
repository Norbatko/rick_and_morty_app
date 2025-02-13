//
//  info.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
