//
//  ContentView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    @State var selectedImage: UIImage?
    @State var isAnalysisSheetShowing: Bool = false
    
    var body: some View {
        VStack {
            Text("DailyCals AI")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            CalendarView()
            
            Spacer()

            ImageSourceSelector(selectedImage: $selectedImage)
        }
        .padding()
        .onChange(of: selectedImage) {
            isAnalysisSheetShowing = selectedImage != nil
        }
        .fullScreenCover(isPresented: .constant(isAnalysisSheetShowing)) {
            AnalysisView(image: selectedImage!, isAnalysisSheetShowing: $isAnalysisSheetShowing)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
