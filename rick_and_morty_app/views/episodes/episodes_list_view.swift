//
//  episodes_list.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 12.02.2025.
//

import SwiftUI

enum SortOrder: String, Identifiable, CaseIterable {
    case episode, name, date
    
    var id: Self { self }
}

struct EpisodeListView: View {
    @StateObject private var viewModel = EpisodeViewModel()
    
    @State private var sortOrder: SortOrder = .episode
    @State private var isAscending: Bool = true

    var sortedEpisodes: [Episode] {
        guard let episodes = viewModel.episodes else { return [] }
        
        let sortedList = episodes.sorted {
            switch sortOrder {
                case .episode:
                    return isAscending ? $0.episode < $1.episode : $0.episode > $1.episode
                case .name:
                    return isAscending ? $0.name < $1.name : $0.name > $1.name
                case .date:
                    return isAscending ? $0.air_date < $1.air_date : $0.air_date > $1.air_date
            }
        }
        return sortedList
    }
   
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Picker("Sort By", selection: $sortOrder) {
                        ForEach(SortOrder.allCases) { sortOrder in
                            Text(sortOrder.rawValue.capitalized).tag(sortOrder)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Button(action: {
                        isAscending.toggle()
                    }) {
                        Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                            .font(.title2)
                            .padding(.leading, 10)
                    }
                }
                .padding(.bottom, 2)
                .padding(.horizontal, 20)
                
                List(sortedEpisodes, id: \.id) { episode in
                    NavigationLink {
                        EpisodeDetailView(episode: episode)
                    } label: {
                        EpisodeRow(episode: episode)
                    }
                }
                .contentMargins(.top, 0)
                .onAppear {
                    viewModel.fetchEpisodes()
                }
            }
            .navigationTitle("Episodes")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
}
