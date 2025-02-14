//
//  characters_list_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 13.02.2025.
//

import SwiftUI

struct CharacterListView: View {
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                CharacterGridView(characters: nil)
            }
            .navigationTitle("Characters")
        }
    }
}
