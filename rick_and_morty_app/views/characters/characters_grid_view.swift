//
//  characters_page_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 14.02.2025.
//

import SwiftUI


struct CharacterGridView: View {
    let characters: [String]?
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(viewModel.characters ?? [], id: \.id) { character in
                CharacterGridItem(character: character)
            }
        }
        .padding()
        .onAppear {
            if (characters != nil) {
                viewModel.fetchCharactersByIDs(characters: characters!)
            } else {
                viewModel.fetchCharacters()
            }
        }
    }
}


