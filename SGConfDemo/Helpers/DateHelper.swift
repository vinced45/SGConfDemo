//
//  DateHelper.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//

import Foundation

struct DateHelper {
    static func create(day: Int, month: Int, hour: Int, minute: Int) -> Date {
        var components = DateComponents()
        components.year = Calendar.current.component(.year, from: Date()) // Current year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute

        return Calendar.current.date(from: components) ?? Date()
    }
}
