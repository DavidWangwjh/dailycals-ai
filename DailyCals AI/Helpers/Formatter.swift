//
//  Formatter.swift
//  DailyCals AI
//
//  Created by David Wang on 1/26/25.
//

import Foundation
import HorizonCalendar

func numberFormatter(_ number: Double, decimal: Int) -> String {
    return String(format: "%.\(decimal)f", number)
}


func monthYearFormatter(from monthComponents: MonthComponents, calendar: Calendar) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = calendar
    dateFormatter.dateFormat = "MMMM yyyy" // Full month name and year (e.g., "November 2024")
    
    // Convert MonthComponents to DateComponents
    var dateComponents = DateComponents()
    dateComponents.year = monthComponents.year
    dateComponents.month = monthComponents.month
    
    // Convert DateComponents to Date
    if let date = calendar.date(from: dateComponents) {
        return dateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}
