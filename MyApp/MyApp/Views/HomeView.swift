//
//  Home.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 14/10/2024.
//
import SwiftUI


struct HomeView: View {
    @StateObject private var viewModel = CarViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.green)
            Text("Welcome to Home")
                .font(.title)
            
            
            Text(currentDate)
                .font(.subheadline)
                .padding(.top, 8)
            
            if let car = viewModel.car {
                VStack {
                    Text("Car Details").font(.title).padding()
                    Text("Make: \(car.make)")
                    Text("Model: \(car.model)")
                    Text("Year: \(car.year)")
                    Text("VIN: \(car.vin)")
                    Text("Price: \(car.price)")
                    Text("Mileage: \(car.mileage)")
                    Text("Condition: \(car.condition)")
                    Text("Dealer: \(car.dealerName)")
                    
                    AsyncImage(url: URL(string: car.primaryPhotoUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 200)
                    } placeholder: {
                        ProgressView() // Show a progress indicator while the image is loading
                    }
                }
            } else {
                Text("Loading car data...")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.fetchCarData() // Fetch the car data when the view appears
        }
    }
    
    // Create a computed property to format the current date
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long // Set the date style (e.g., October 14, 2024)
        return dateFormatter.string(from: Date())
    }
}


#Preview {
    HomeView()
}

