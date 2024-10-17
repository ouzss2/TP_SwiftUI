//
//  Car.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 14/10/2024.
//


import Foundation

// Define your Car struct
struct Car: Codable, Identifiable {
    let id: Int
    let vin: String
    let displayColor: String
    let year: Int
    let make: String
    let model: String
    let price: String
    let mileage: String
    let city: String
    let primaryPhotoUrl: String
    let condition: String
    let dealerName: String
}



