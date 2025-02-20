//
//  FoodListView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/27/25.
//

import SwiftUI

struct FoodListView: View {
    
    var foodItems: [Food]

    @State var selectedFood: Food?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 10) {
                ForEach(foodItems) { foodItem in
                    FoodPreview(image: foodItem.image, title: foodItem.title, totalCals: foodItem.totalCalories)
                        .onTapGesture {
                            selectedFood = foodItem
                        }
                }
            }
            .padding(.horizontal)
        }
        .sheet(item: $selectedFood) { food in
            FoodDetailView(food: food)
        }
    }
}

#Preview {
    FoodListView(foodItems: Array(ModelData().foods.prefix(4)))
}
