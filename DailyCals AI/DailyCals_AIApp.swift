//
//  DailyCals_AIApp.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

@main
struct DailyCals_AIApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
