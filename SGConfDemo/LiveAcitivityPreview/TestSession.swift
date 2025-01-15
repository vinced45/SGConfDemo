//
//  TestSession.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import SwiftUI
import WidgetKit

struct TestSession: Identifiable, Hashable, Equatable {
    var id: UUID = UUID()
    var attribute: SessionActivityAttributes
    var state: SessionActivityAttributes.ContentState

    static func == (lhs: TestSession, rhs: TestSession) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension TestSession {
    static let all: [TestSession] = [
        .init(attribute: TestSession.deepDive, state: TestSession.vince),
        .init(attribute: TestSession.deepDive, state: TestSession.tim)
    ]
    
    static let deepDive: SessionActivityAttributes = .init()
    static let vince: SessionActivityAttributes.ContentState =
        .init(
            sessionID: UUID(),
            sessionTitle: "Exploring Advanced Techniques",
            sessionStartTime: Date(),
            sessionEndTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!,
            speakerName: "Vince Davis",
            speakerImageFileName: "sdffs",
            isFavorite: true)
    
    static let tim: SessionActivityAttributes.ContentState =
        .init(
            sessionID: UUID(),
            sessionTitle: "Exploring Swift",
            sessionStartTime: Date(),
            sessionEndTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
            speakerName: "Charlie Chapman",
            speakerImageFileName: "sfsdfs",
            isFavorite: false)
}
