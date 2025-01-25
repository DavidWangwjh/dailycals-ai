//
//  ContentView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack {
            Text(modelData.food.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
