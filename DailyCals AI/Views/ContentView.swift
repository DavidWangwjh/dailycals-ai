//
//  ContentView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    @State var selectedDate = Date.now
    @State var selectedImage: UIImage?
    @State var isAnalysisSheetShowing: Bool = false
    
    let foodByDate: [Date: [Food]] = Dictionary(grouping: ModelData().foods) { food in
        // Use only the date components for grouping
        Calendar.current.startOfDay(for: food.createdAt)
    }
    
    let foodCountByDate: [Date: Int] = Dictionary(grouping: ModelData().foods) { food in
        // Group foods by the start of the day
        Calendar.current.startOfDay(for: food.createdAt)
    }.mapValues { $0.count }
    
    var body: some View {
        VStack {
            Text("DailyCals AI")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            CalendarView(selectedDate: $selectedDate, foodCountByDate: foodCountByDate)
                .padding(.bottom, -40)
            
            FoodListView(foodItems: foodByDate[selectedDate] ?? [])
            
            Spacer()

            ImageSourceSelector(selectedImage: $selectedImage)
        }
        .padding(.vertical)
        .onChange(of: selectedImage) {
            isAnalysisSheetShowing = selectedImage != nil
        }
        .fullScreenCover(isPresented: .constant(isAnalysisSheetShowing)) {
            AnalysisView(date: selectedDate, image: selectedImage!, isAnalysisSheetShowing: $isAnalysisSheetShowing)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
