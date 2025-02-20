//
//  ModelData.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation

@Observable
class ModelData {
    var foods: [Food]
    let calendar = Calendar.current

    init() {
        foods = [
            Food(
                id: 1,
                title: "Cheeseburger",
                imageDescription: "A delicious-looking cheeseburger with a sesame seed bun, lettuce, and melted cheese.",
                ingredients: [
                    Ingredient(title: "Bun", caloriesPerGram: 2.5, totalGram: 50, totalCalories: 125),
                    Ingredient(title: "Beef Patty", caloriesPerGram: 2.5, totalGram: 100, totalCalories: 250),
                    Ingredient(title: "Cheese", caloriesPerGram: 4.0, totalGram: 30, totalCalories: 120)
                ],
                totalCalories: 495,
                imageName: "cheeseburger",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 2, day: 17))!
            ),
            Food(
                id: 2,
                title: "Veggie Pizza",
                imageDescription: "A freshly baked veggie pizza loaded with bell peppers, onions, and olives.",
                ingredients: [
                    Ingredient(title: "Pizza Dough", caloriesPerGram: 2.8, totalGram: 200, totalCalories: 560),
                    Ingredient(title: "Cheese", caloriesPerGram: 4.0, totalGram: 50, totalCalories: 200),
                    Ingredient(title: "Veggies", caloriesPerGram: 1.2, totalGram: 100, totalCalories: 120)
                ],
                totalCalories: 880,
                imageName: "veggie_pizza",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 2, day: 17))!
            ),
            Food(
                id: 3,
                title: "Chicken Salad",
                imageDescription: "A healthy chicken salad with greens, grilled chicken, and a light vinaigrette.",
                ingredients: [
                    Ingredient(title: "Greens", caloriesPerGram: 0.5, totalGram: 150, totalCalories: 75),
                    Ingredient(title: "Chicken", caloriesPerGram: 2.0, totalGram: 100, totalCalories: 200),
                    Ingredient(title: "Dressing", caloriesPerGram: 1.5, totalGram: 50, totalCalories: 75)
                ],
                totalCalories: 350,
                imageName: "chicken_salad",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 2, day: 17))!
            ),
            Food(
                id: 4,
                title: "Pasta Bolognese",
                imageDescription: "Classic pasta bolognese with tomato sauce and ground beef.",
                ingredients: [
                    Ingredient(title: "Pasta", caloriesPerGram: 3.5, totalGram: 150, totalCalories: 525),
                    Ingredient(title: "Sauce", caloriesPerGram: 1.0, totalGram: 100, totalCalories: 100),
                    Ingredient(title: "Beef", caloriesPerGram: 2.5, totalGram: 100, totalCalories: 250)
                ],
                totalCalories: 875,
                imageName: "pasta_bolognese",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 2, day: 17))!
            ),
            Food(
                id: 5,
                title: "Avocado Toast",
                imageDescription: "Crunchy toast topped with mashed avocado and a sprinkle of chili flakes.",
                ingredients: [
                    Ingredient(title: "Bread", caloriesPerGram: 2.5, totalGram: 80, totalCalories: 200),
                    Ingredient(title: "Avocado", caloriesPerGram: 1.6, totalGram: 100, totalCalories: 160)
                ],
                totalCalories: 360,
                imageName: "avocado_toast",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 15))!
            ),
            Food(
                id: 6,
                title: "Chocolate Cake",
                imageDescription: "A rich and moist chocolate cake with creamy frosting.",
                ingredients: [
                    Ingredient(title: "Cake", caloriesPerGram: 3.8, totalGram: 150, totalCalories: 570),
                    Ingredient(title: "Frosting", caloriesPerGram: 4.5, totalGram: 50, totalCalories: 225)
                ],
                totalCalories: 795,
                imageName: "chocolate_cake",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 19))!
            ),
            Food(
                id: 7,
                title: "Smoothie Bowl",
                imageDescription: "A vibrant smoothie bowl topped with granola and fresh fruit.",
                ingredients: [
                    Ingredient(title: "Smoothie", caloriesPerGram: 1.2, totalGram: 300, totalCalories: 360),
                    Ingredient(title: "Granola", caloriesPerGram: 4.0, totalGram: 50, totalCalories: 200),
                    Ingredient(title: "Fruits", caloriesPerGram: 0.8, totalGram: 100, totalCalories: 80)
                ],
                totalCalories: 640,
                imageName: "smoothie_bowl",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 24))!
            ),
            Food(
                id: 8,
                title: "Grilled Salmon",
                imageDescription: "A perfectly grilled salmon fillet with lemon and dill.",
                ingredients: [
                    Ingredient(title: "Salmon", caloriesPerGram: 2.5, totalGram: 200, totalCalories: 500),
                    Ingredient(title: "Lemon", caloriesPerGram: 0.5, totalGram: 50, totalCalories: 25)
                ],
                totalCalories: 525,
                imageName: "grilled_salmon",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 24))!
            ),
            Food(
                id: 9,
                title: "Pancakes",
                imageDescription: "Fluffy pancakes topped with maple syrup and butter.",
                ingredients: [
                    Ingredient(title: "Pancakes", caloriesPerGram: 2.5, totalGram: 200, totalCalories: 500),
                    Ingredient(title: "Maple Syrup", caloriesPerGram: 3.0, totalGram: 50, totalCalories: 150),
                    Ingredient(title: "Butter", caloriesPerGram: 7.2, totalGram: 30, totalCalories: 216),
                    Ingredient(title: "Pancakes", caloriesPerGram: 2.5, totalGram: 200, totalCalories: 500),
                    Ingredient(title: "Maple Syrup", caloriesPerGram: 3.0, totalGram: 50, totalCalories: 150),
                    Ingredient(title: "Butter", caloriesPerGram: 7.2, totalGram: 30, totalCalories: 216),
                    Ingredient(title: "Pancakes", caloriesPerGram: 2.5, totalGram: 200, totalCalories: 500),
                    Ingredient(title: "Maple Syrup", caloriesPerGram: 3.0, totalGram: 50, totalCalories: 150),
                    Ingredient(title: "Butter", caloriesPerGram: 7.2, totalGram: 30, totalCalories: 216),
                    Ingredient(title: "Pancakes", caloriesPerGram: 2.5, totalGram: 200, totalCalories: 500),
                    Ingredient(title: "Maple Syrup", caloriesPerGram: 3.0, totalGram: 50, totalCalories: 150),
                    Ingredient(title: "Butter", caloriesPerGram: 7.2, totalGram: 30, totalCalories: 216)
                ],
                totalCalories: 866,
                imageName: "pancakes",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 24))!
            ),
            Food(
                id: 10,
                title: "Caesar Salad",
                imageDescription: "A fresh Caesar salad with croutons and parmesan.",
                ingredients: [
                    Ingredient(title: "Lettuce", caloriesPerGram: 0.5, totalGram: 100, totalCalories: 50),
                    Ingredient(title: "Croutons", caloriesPerGram: 3.5, totalGram: 50, totalCalories: 175),
                    Ingredient(title: "Parmesan", caloriesPerGram: 4.0, totalGram: 30, totalCalories: 120)
                ],
                totalCalories: 345,
                imageName: "caesar_salad",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 24))!
            ),
            Food(
                id: 11,
                title: "Tacos",
                imageDescription: "Tacos filled with beef, cheese, and fresh veggies.",
                ingredients: [
                    Ingredient(title: "Tortilla", caloriesPerGram: 2.0, totalGram: 80, totalCalories: 160),
                    Ingredient(title: "Beef", caloriesPerGram: 2.5, totalGram: 100, totalCalories: 250),
                    Ingredient(title: "Cheese", caloriesPerGram: 4.0, totalGram: 30, totalCalories: 120)
                ],
                totalCalories: 530,
                imageName: "tacos",
                createdAt: calendar.date(from: DateComponents(year: 2025, month: 1, day: 26))!
            )
        ]
    }
}
