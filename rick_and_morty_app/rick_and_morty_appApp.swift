//
//  rick_and_morty_appApp.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

import SwiftUI

@main
struct rick_and_morty_appApp: App {
    var body: some Scene {
        WindowGroup {
            EpisodeListView()
        }
    }
}

#Preview {
    EpisodeListView()
}
