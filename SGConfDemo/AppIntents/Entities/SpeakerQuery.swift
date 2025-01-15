//
//  SpeakerQuery.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//


import AppIntents
import SwiftUI
import SwiftData

struct SpeakerQuery: EntityQuery {
    // Provide the list of options you want to show the user, when they select the Entity in the shortcut. You probably want to show all items you have from your array.
    func suggestedEntities() async throws -> [SpeakerEntity] {
        return await ConfSessionManager().fetchSpeakers()
            .map({ SpeakerEntity(speaker: $0)})
    }
    
    func allEntities() async throws -> [SpeakerEntity] {
        return await ConfSessionManager().fetchSpeakers()
            .map({ SpeakerEntity(speaker: $0)})
    }

    // Find Entity by id to bridge the Shortcuts Entity to your App
    func entities(for identifiers: [UUID]) async throws -> [SpeakerEntity] {
        return await ConfSessionManager().fetchSpeakers(with: identifiers)
            .map({ SpeakerEntity(speaker: $0)})
    }
}
