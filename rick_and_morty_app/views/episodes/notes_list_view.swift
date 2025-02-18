//
//  notes_view.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 18.02.2025.
//

import SwiftUI

struct NotesListView: View {
    @State private var notes: [(text: String, timestamp: String)] = []
    
    var episodeID: Int
    
    var body: some View {
        VStack {
            Text("My Notes")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(notes, id: \.timestamp) { note in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(note.text)
                                .font(.body)
                                .foregroundColor(.primary)
                            Text("Published: \(formatTimestamp(note.timestamp))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            deleteNote(with: note.timestamp)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .onAppear {
                loadNotes()
            }
            .padding(.horizontal)
        }
    }
    
    // Fetch all notes with the episodeID from UserDefaults
    func loadNotes() {
        var fetchedNotes: [(text: String, timestamp: String)] = []
        
        let userDefaults = UserDefaults.standard
        let keys = userDefaults.dictionaryRepresentation().keys.filter { $0.contains(String(episodeID)) && $0.starts(with: "savedNote_") }
        
        for key in keys {
            if let noteText = userDefaults.string(forKey: key),
               let timestamp = extractTimestamp(from: key) {
                fetchedNotes.append((text: noteText, timestamp: timestamp))
            }
        }
        
        notes = fetchedNotes.sorted { $0.timestamp > $1.timestamp }  // Sort by timestamp in descending order
    }
    
    // Delete note by timestamp
    func deleteNote(with timestamp: String) {
        let userDefaults = UserDefaults.standard
        let keyToDelete = "savedNote_\(episodeID)_\(timestamp)"
        userDefaults.removeObject(forKey: keyToDelete)
        
        // Reload notes after deletion
        loadNotes()
    }
    
    // Extract timestamp from the key
    func extractTimestamp(from key: String) -> String? {
        let components = key.split(separator: "_")
        guard components.count > 2 else { return nil }
        return String(components[2]+"_"+components[3])  // Extracts the timestamp part of the key
    }
    
    // Format timestamp for display
    func formatTimestamp(_ timestamp: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd_HHmmss" // Same format as used for saving the timestamp
        
        if let date = formatter.date(from: timestamp) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        
        return timestamp
    }
}
