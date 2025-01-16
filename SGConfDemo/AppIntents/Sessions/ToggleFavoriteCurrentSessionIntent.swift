//
//  ToggleFavoriteCurrentSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//


import AppIntents
import SwiftUI
import SwiftData

struct ToggleFavoriteCurrentSessionIntent: AppIntent {
    @Dependency
    private var appState: AppState
    
    static var title: LocalizedStringResource = "Toggle favorite for current session"
    static var description = IntentDescription(
        "Toggles the favorite status of a given session.",
        categoryName: "Session"
    )

    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard let session = appState.currentSession else {
            return .result(dialog: "There is no current session" )
        }
        let intent = ToggleFavoriteSessionIntent(sessionID: session.id.uuidString)
        do {
            _ = try await intent.perform()
        }
        let updatedSession = try await ConfSessionManager().fetchSession(id: session.id)
        return .result(dialog: "Session \(updatedSession?.title ?? "") is now \(updatedSession?.isFavorite ?? false ? "favorite" : "not favorite")")
    }
}
