//
//  ModelData.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation

@Observable
class ModelData {
    var food: Food
    var currentDate: Date = Date()

    init() {
        self.food = Food(
            title: "Cheeseburger",
            imageDescription: "A delicious-looking cheeseburger featuring a sesame seed bun, fresh lettuce, pickles, ketchup, and melted cheese over a beef patty, with a side of fries in the background.",
            ingredients: [
                Ingredient(title: "Sesame seed bun", caloriesPerGram: 2.5,  totalGram: 60, totalCalories: 150),
                Ingredient(title: "Beef patty",       caloriesPerGram: 2.5,  totalGram: 100, totalCalories: 250),
                Ingredient(title: "Cheddar cheese",  caloriesPerGram: 4.0,  totalGram: 30,  totalCalories: 120),
                Ingredient(title: "Ketchup",         caloriesPerGram: 1.0,  totalGram: 20,  totalCalories: 20),
                Ingredient(title: "Lettuce",         caloriesPerGram: 0.15, totalGram: 15,  totalCalories: 2),
                Ingredient(title: "Pickles",         caloriesPerGram: 0.5,  totalGram: 20,  totalCalories: 10),
                Ingredient(title: "Onion",           caloriesPerGram: 0.4,  totalGram: 15,  totalCalories: 6)
            ],
            totalCalories: 558,
            imageName: "cheeseburger"
        )
    }
}
