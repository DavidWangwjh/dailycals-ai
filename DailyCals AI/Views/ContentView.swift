//
//  ContentView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .trailing).combined(with: .opacity)
        )
    }
}

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
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Spacer()
            
            CalendarView(selectedDate: $selectedDate, foodCountByDate: foodCountByDate)
            
            if let items = foodByDate[selectedDate],
               !items.isEmpty {
                FoodListView(foodItems: items)
                // Animate how the FoodListView enters/exits
                    .offset(y: -55)
                    .transition(.moveAndFade)
            }
            
            Spacer()

            ImageSourceSelector(selectedImage: $selectedImage)
        }
//        .background(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .animation(.easeInOut(duration: 0.7), value: selectedDate)
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
