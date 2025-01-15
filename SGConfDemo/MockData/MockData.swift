//
//  MockData.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//


import Foundation

struct MockData {
    static let sessions: [ConfSession] = [
        ConfSession(
            id: UUID(),
            title: "Keynote: The Future of Swift",
            startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!,
            desc: "Join us for an exciting keynote about the latest and greatest advancements in Swift."
        ),
        ConfSession(
            id: UUID(),
            title: "SwiftUI Deep Dive",
            startTime: Calendar.current.date(bySettingHour: 10, minute: 30, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 11, minute: 30, second: 0, of: Date())!,
            desc: "Explore advanced techniques in SwiftUI with hands-on examples and real-world use cases."
        ),
        ConfSession(
            id: UUID(),
            title: "Concurrency in Swift: Best Practices",
            startTime: Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 13, minute: 0, second: 0, of: Date())!,
            desc: "Learn how to write efficient and safe concurrent code in Swift using async/await."
        ),
        ConfSession(
            id: UUID(),
            title: "Networking with Swift: Beyond the Basics",
            startTime: Calendar.current.date(bySettingHour: 14, minute: 0, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date())!,
            desc: "A comprehensive session on making network requests and managing responses effectively in Swift."
        )
    ]
}