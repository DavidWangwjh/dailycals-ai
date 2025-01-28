//
//  Food.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation
import SwiftUI

struct Ingredient: Codable {
    var title: String
    var caloriesPerGram: Double
    var totalGram: Double
    var totalCalories: Double
}

struct Food: Codable, Identifiable {
    var id: Int
    var title: String
    var imageDescription: String
    var ingredients: [Ingredient]
    var totalCalories: Double
    
    var imageName: String
    var image: Image {
        if let uiImage = UIImage(named: imageName) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "photo") // Fallback to a default system image
        }
    }
    
    var createdAt: Date
}
