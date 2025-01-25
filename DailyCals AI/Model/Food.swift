//
//  Food.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation

struct Ingredient: Codable {
    var title: String
    var caloriesPerGram: Double
    var totalGram: Double
    var totalCalories: Double
}

struct Food: Codable {
    var title: String
    var imageDescription: String
    var ingredients: [Ingredient]
    var totalCalories: Double
}
