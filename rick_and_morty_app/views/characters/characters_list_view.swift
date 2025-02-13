//
//  characters_list_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    var body: some View {
        if (viewModel.characters?.isEmpty ?? true) {
            Text("Loading...")
        } else {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.characters ?? [], id: \.id) { character in
                            CharacterGridItem(character: character)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Characters")
                .onAppear {
                    viewModel.fetchCharacters()
                }
            }
        }
    }
}
