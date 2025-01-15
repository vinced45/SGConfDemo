//
//  GetNextSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import AppIntents
import SwiftUI
import SwiftData

struct GetNextSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Next Session"
    static var description: IntentDescription = "Fetches the next session with speaker details."

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let sessionManager = ConfSessionManager()

        // Fetch the next session
        let sessions = await sessionManager.fetchSessions()
        guard let nextSession = sessions.sorted(by: { $0.startTime < $1.startTime }).first else {
            return .result(dialog: "You have no upcoming sessions.")
        }

        return .result(
            dialog: "Your next session is '\(nextSession.title)', starting at \(nextSession.startTime.formatted())."
        )
    }
}

struct ShowFirstSessionIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "Show First Session"
    static var description: IntentDescription = "Shows the first session with speaker details."

    func perform() async throws -> some IntentResult {
        let sessionManager = ConfSessionManager()
        
        // Fetch the next session
        let sessions = await sessionManager.fetchSessions()
        guard let nextSession = sessions.sorted(by: { $0.startTime < $1.startTime }).first else {
            return .result()
        }
        print("First session: \(nextSession)")
        LiveActivityManager.updateLiveActivity(id: nextSession.id,
                                               sessionName: nextSession.title,
                                               startTime: nextSession.startTime,
                                               endTime: nextSession.endTime,
                                               speaker: nextSession.speaker?.name ?? "",
                                               imageUrl: nextSession.speaker?.photoURL ?? "",
                                               isFavorite: nextSession.isFavorite
        )

        return .result()
    }
}

struct ShowLastSessionIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "Show Next Session"
    static var description: IntentDescription = "Shows the next session with speaker details."

    func perform() async throws -> some IntentResult {
        let sessionManager = ConfSessionManager()
        
        // Fetch the next session
        let sessions = await sessionManager.fetchSessions()
        guard let nextSession = sessions.sorted(by: { $0.startTime < $1.startTime }).last else {
            return .result()
        }
        print("last session: \(nextSession)")
        LiveActivityManager.updateLiveActivity(id: nextSession.id,
                                               sessionName: nextSession.title,
                                               startTime: nextSession.startTime,
                                               endTime: nextSession.endTime,
                                               speaker: nextSession.speaker?.name ?? "",
                                               imageUrl: nextSession.speaker?.photoURL ?? "",
                                               isFavorite: nextSession.isFavorite)

        return .result()
    }
}
