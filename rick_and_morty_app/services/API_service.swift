//
//  API_service.swift
//  rick_and_morty_app
//
//  Created by Tomáš Ebert on 11.02.2025.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private let baseURL = "https://rickandmortyapi.com/api"
    
    private func fetchData<T: Decodable>(from endpoint: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(decodedResponse)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchEpisodes(completion: @escaping ([Episode]?) -> Void) {
        fetchData(from: "episode") { (response: EpisodeResponse?) in
            completion(response?.results)
        }
    }
    
    func fetchEpisode(id: Int, completion: @escaping (Episode?) -> Void) {
        fetchData(from: "episode/\(id)") { (response: Episode?) in
            completion(response)
        }
    }
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        fetchData(from: "character") { (response: CharacterResponse?) in
            completion(response?.results)
        }
    }
    
    func fetchCharactersByIDs(characters: [String], completion: @escaping ([Character]?) -> Void) {
        let ids = characters.compactMap { URL(string: $0)?.lastPathComponent }
        let idsString = ids.map { String($0) }.joined(separator: ",")
        
        fetchData(from: "character/\(idsString)") { (response: [Character]?) in
            completion(response)
        }
    }
}
