//
//  CalendarView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI
import HorizonCalendar

let calendar = Calendar.current
let startDate = calendar.date(from: DateComponents(year: 2024, month: 11, day: 01))!
let endDate = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: Date()))!


func firstSundayOfMonth(for date: Date, using calendar: Calendar) -> Date? {
    // Get the first day of the month
    guard let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
        return nil
    }

    // Find the weekday for the first day of the month
    let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)

    // Calculate the difference to the next Sunday
    let daysToAdd = (8 - firstDayWeekday) % 7

    // Add the difference to get the first Sunday
    return calendar.date(byAdding: .day, value: daysToAdd, to: firstDayOfMonth)
}

struct CalendarView: View {
    @Environment(ModelData.self) var modelData
    
    @State private var selectedDate = Date()
    private let proxy = CalendarViewProxy()
    
    var body: some View {
        CalendarViewRepresentable(
          calendar: calendar,
          visibleDateRange: startDate...endDate,
          monthsLayout: .horizontal,
          dataDependency: nil,
          proxy: proxy
        )
        .interMonthSpacing(10)
        .verticalDayMargin(10)
        .monthHeaders { month in
            MonthHeaderView(month: month)
        }
        .days { day in
            let date = calendar.date(from: day.components) // Convert DayComponents to Date
            DayView(
                day: day,
                isSelected: date != nil && calendar.isDate(date!, inSameDayAs: selectedDate),
                isToday: date != nil && calendar.isDateInToday(date!)
            )
            .onTapGesture {
                selectedDate = date! // Update the selected date on tap
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            if let firstSunday = firstSundayOfMonth(for: selectedDate, using: calendar) {
                proxy.scrollToDay(containing: firstSunday, scrollPosition: .firstFullyVisiblePosition, animated: false)
            }
        }
    }
}

struct MonthHeaderView: View {
    let month: MonthComponents

    var body: some View {
        Text(monthYearFormatter(from: month, calendar: calendar))
            .font(.title2)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct DayView: View {
    let day: DayComponents
    let isSelected: Bool
    let isToday: Bool

    var body: some View {
        
        VStack {
            Text("\(day.day)")
                .font(.system(size: 20))
            if day.day % 4 == 0 {
                Text("2")
                    .font(.system(size: 12))
            } else {
                Text("")
                    .font(.system(size: 12))
            }
        }
        .frame(width: 50, height: 50)
        .background(isSelected ? Color.blue : (isToday ? Color.gray : Color.clear))
        .foregroundColor(isSelected || isToday ? .white : .black)
        .cornerRadius(10)
    }
}

#Preview {
    CalendarView()
        .environment(ModelData())
}
