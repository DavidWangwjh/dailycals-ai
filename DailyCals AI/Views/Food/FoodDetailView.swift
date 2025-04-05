//
//  FoodDetailView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/27/25.
//

import SwiftUI

struct FoodDetailView: View {
    
    var food: Food
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                Text(food.createdAt, format: .dateTime.weekday().day().month().year())
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Divider()
                
                food.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .cornerRadius(10) // Add rounded corners
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 8)
                    )
                    .shadow(color: .gray, radius: 5)
                    .padding()
                
                Text("\(food.title)")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(food.imageDescription)")
                
                Divider()
                
                Text("Ingredients")
                    .font(.title2)
                ForEach(food.ingredients, id: \.title) { ingredient in
                    HStack {
                        Text("\(ingredient.title)")
                        
                        Spacer()
                        
                        Text("\(Int(ingredient.totalCalories)) cals")
                    }
                }
                .padding(.horizontal)
                HStack {
                    Text("Total")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("\(Int(food.totalCalories)) cals")
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    FoodDetailView(food: ModelData().foods[5])
}
