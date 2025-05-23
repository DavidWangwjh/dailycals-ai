//
//  AnalysisResultView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI


struct AnalysisResultView: View {
    let result: Food
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(result.title)")
                .font(.title)
                .fontWeight(.bold)
            Text("\(result.imageDescription)")
            
            Divider()
            
            Text("Ingredients")
                .font(.title2)
            ForEach(result.ingredients, id: \.title) { ingredient in
                HStack {
                    Text("\(ingredient.title)")
                    
                    Spacer()
                    
                    Text("\(numberFormatter(ingredient.totalCalories, decimal: 2)) cals")
                }
            }
            .padding(.horizontal)
            HStack {
                Text("Total")
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("\(numberFormatter(result.totalCalories, decimal: 2)) cals")
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    AnalysisResultView(result: ModelData().foods[0])
}
