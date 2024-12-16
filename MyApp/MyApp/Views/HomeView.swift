//
//  Home.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 14/10/2024.
//
import SwiftUI
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        VStack {
            Text("Top Movies")
                .font(.title)
                .padding()
            
            Text(currentDate)
                .font(.subheadline)
                .padding(.bottom, 8)
            
            if viewModel.movies.isEmpty {
                Text("Loading movies...")
                    .font(.headline)
                    .padding()
            } else {
                List(viewModel.movies) { movie in
                    HStack {
                        AsyncImage(url: URL(string: movie.image)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(movie.title)
                            .font(.headline)
                            .padding(.leading, 10)
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchMovies()
        }
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: Date())
    }
}

#Preview {
    HomeView()
}
