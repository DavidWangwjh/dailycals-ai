//
//  FoodListView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/27/25.
//

import SwiftUI

struct FoodListView: View {
    
    var foodItems: [Food]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 0) {
                ForEach(foodItems) { foodItem in
                    NavigationLink {
                        FoodDetailView()
                    } label: {
                        FoodPreview(image: foodItem.image, title: foodItem.title, totalCals: foodItem.totalCalories)
                    }
                }
            }
        }
    }
}

#Preview {
    FoodListView(foodItems: Array(ModelData().foods.prefix(4)))
}
