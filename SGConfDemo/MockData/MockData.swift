//
//  MockData.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import Foundation
import SwiftData

struct MockData {
    static let speakers: [Speaker] = [
        .klemens,
        .carola,
        .christian,
        .paul,
        .jane,
        .donny,
        .daniel,
        .riana,
        .alex,
        .charlie,
        .dai,
        .he,
        .jasper,
        .jeff,
        .kosala,
        .krzysztof,
        .monika,
        .mustafa,
        .priyal,
        .ryan,
        .vijay,
        .vince
    ]

    static let sessions: [ConfSession] = [
        .levelupPart1,
        .levelupPart2,
        .swiftConcurrencyPart1,
        .swiftConcurrencyPart2,
        .bulidingHyper,
        .userdefaults,
        .sideEffects
    ]
    
    func seedMockDataIfNeeded(using context: ModelContext) {
        do {
            // Check if data already exists
            let existingSessions = try context.fetch(FetchDescriptor<ConfSession>())
            if !existingSessions.isEmpty {
                print("Mock data already seeded.")
                return
            }

            // Insert mock speakers
            for speaker in MockData.speakers {
                context.insert(speaker)
            }

            // Insert mock sessions
            for session in MockData.sessions {
                context.insert(session)
            }

            // Save the context
            try context.save()
            print("Mock data seeded successfully.")
        } catch {
            print("Error seeding mock data: \(error)")
        }
    }
}

