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
    
    private var isAnalysisSheetShowing: Bool {
        selectedImage != nil
    }
    
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
        .fullScreenCover(isPresented: .constant(isAnalysisSheetShowing)) {
            ImageView(image: selectedImage!)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
