//
//  rating_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 18.02.2025.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maxRating: Int = 5

    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { star in
                Image(systemName: star <= rating ? "star.fill" : "star")
                    .foregroundColor(star <= rating ? .yellow : .gray)
                    .onTapGesture {
                        rating = star
                    }
            }
        }
        .font(.subheadline)
    }
}
