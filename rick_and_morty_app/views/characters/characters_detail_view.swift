//
//  characters_detail_screen.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 15.02.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    let formatter = ISO8601DateFormatter()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    // Character Image (Fills the top portion of the screen)
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.65)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.65)
                    }
                    
                    // Character Info (Below the image)
                    VStack(alignment: .leading, spacing: 15) {
                        Text(character.name)
                            .font(.largeTitle)
                            .bold()
                        
                        HStack {
                            Text("Species: \(character.species)")
                            Spacer()
                            Text("Status: \(character.status)")
                                .foregroundColor(character.status == "Alive" ? .green : .red)
                        }
                        .font(.headline)
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Gender: \(character.gender)")
                            Text("Type: \(character.type == "" ? "None" : character.type)")
                            Text("Origin: \(character.origin.name)")
                            Text("Location: \(character.location.name)")
                            Text("Date of creation: \(character.created)")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        Link("Download avatar", destination: URL(string: character.image)!)
                            .foregroundColor(.indigo)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    .padding(.top, -30)
                }
            }
        }
        .edgesIgnoringSafeArea(.top) // Allows the image to extend to the top
        .background(Color(UIColor.systemBackground))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.backward.circle.fill")
                            .resizable() // Makes the image scalable
                            .frame(width: 30, height: 30) // Adjusts size
                            .foregroundColor(.white) // Sets icon color
                            .background(Circle().fill(Color.blue)) // Adds a background
                            .padding(5) // Increases tap area
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
}
