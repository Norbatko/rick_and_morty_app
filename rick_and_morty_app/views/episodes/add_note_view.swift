//
//  add_note_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 18.02.2025.
//

import SwiftUI

struct AddNoteView: View {
    @State private var noteText: String = ""
    let episodeID: Int
    
    let noteKey = "savedNote"

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Write a Review")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top)
                Spacer()
                Button(action: {dismiss()}) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable() // Makes the image scalable
                        .frame(width: 30, height: 30) // Adjusts size
                        .padding(5) // Increases tap area
                }
            }

            Divider()

            TextEditor(text: $noteText)
                .frame(maxHeight: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .opacity(0.8)

            // Save Note Button
            Button(action: {
                saveNote()
            }) {
                Text("Save Note")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.top, 12)

            Spacer()

        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
    }
    
    func saveNote() {
        let timestamp = getCurrentTimestamp()
        print(timestamp)
        let noteKey = "savedNote_\(episodeID)_\(timestamp)"  // Unique key based on timestamp
        UserDefaults.standard.set(noteText, forKey: noteKey)
        dismiss()
    }
    
    func getCurrentTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd_HHmmss" // Format timestamp as "20250218_153045"
        return formatter.string(from: Date())
    }
}
