//
//  MoviesViewModel.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 18/11/2024.
//

import SwiftUI

struct Movie: Identifiable, Decodable {
    let id = UUID() // Unique ID for SwiftUI
    let title: String
    let image: String
}

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func fetchMovies() {
        guard let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("18024fb7bcmshd76a937c328c985p1147d9jsn8273faa1f53e", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("imdb-top-100-movies.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching movies: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
