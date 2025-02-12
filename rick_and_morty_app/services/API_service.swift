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
    
    func fetchEpisodes(completion: @escaping ([Episode]?) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/episode"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
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
                let decodedResponse = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                completion(decodedResponse.results)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
