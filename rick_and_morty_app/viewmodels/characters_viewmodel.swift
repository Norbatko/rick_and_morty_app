//
//  characters_viewmodel.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character]?
    
    func fetchCharacters() {
        APIService.shared.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters
            }
        }
    }
    
    func getCharacterImageURL(from characters: [String]) -> URL? {
        guard let firstCharacterURL = characters.first else { return nil }
        let id = firstCharacterURL.split(separator: "/").last ?? ""
        return URL(string: "https://rickandmortyapi.com/api/character/\(id).png")
    }
}
