//
//  storage_service.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 18.02.2025.
//

import Foundation

class RatingStorage {
    private static let ratingKey = "episodeRating"
    
    // Save rating to UserDefaults
    static func saveRating(for episodeID: Int, rating: Int) {
        UserDefaults.standard.set(rating, forKey: "\(ratingKey)_\(episodeID)")
    }
    
    // Load rating from UserDefaults
    static func loadRating(for episodeID: Int) -> Int? {
        return UserDefaults.standard.integer(forKey: "\(ratingKey)_\(episodeID)")
    }
}
