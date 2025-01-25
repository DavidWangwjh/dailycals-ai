//
//  CalendarView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct CalendarView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        Text("\(modelData.currentDate)")
    }
}

#Preview {
    CalendarView()
        .environment(ModelData())
}
