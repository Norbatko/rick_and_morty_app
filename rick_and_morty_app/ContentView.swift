//
//  ContentView.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            EpisodeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Episodes")
                }
            CharacterListView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Characters")
                }
        }
    }
}

#Preview {
    ContentView()
}
