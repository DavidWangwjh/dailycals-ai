//
//  FoodPreview.swift
//  DailyCals AI
//
//  Created by David Wang on 1/27/25.
//

import SwiftUI

struct FoodPreview: View {
    
    var image: Image
    var title: String
    var totalCals: Double
    
    var body: some View {
        ZStack {
            // Background Image with Opacity
            image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .opacity(0.5) // Adjust opacity for better visibility of text
                .cornerRadius(10) // Add rounded corners
                .clipped()
            
            // Overlay Text
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(radius: 10) // Add shadow for better readability
                
                Text("\(Int(totalCals)) cals") // Convert totalCals to an integer
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            }
        }
        .frame(width: 100, height: 100) // Match the frame size of the image
        .background(Color.black.opacity(0.7)) // Optional: Add a slight background tint
        .cornerRadius(10) // Rounded corners for the entire ZStack
    }
}

#Preview {
    let modelData = ModelData()
    FoodPreview(image: modelData.foods[0].image, title: modelData.foods[0].title, totalCals: modelData.foods[0].totalCalories)
}
