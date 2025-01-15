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
    static var description: IntentDescription = "Fetches the session before or after the current one"

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
