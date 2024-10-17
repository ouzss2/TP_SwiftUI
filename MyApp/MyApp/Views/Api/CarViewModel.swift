//
//  CarViewModel.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 14/10/2024.
//

import Foundation
import Combine

class CarViewModel: ObservableObject {
    @Published var car: Car? 

    func fetchCarData() {
        let urlString = "https://auto.dev/api/listings?apikey=ZrQEPSkKb3Vzc2VtYW1hbnNvdXJpNEBnbWFpbC5jb20="
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }

            // Decode the JSON response
            do {
                let car = try JSONDecoder().decode(Car.self, from: data)
                DispatchQueue.main.async {
                    //self.car = car // Update the published car data on the main thread
                    print(car)
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume() // Start the network request
    }
}

