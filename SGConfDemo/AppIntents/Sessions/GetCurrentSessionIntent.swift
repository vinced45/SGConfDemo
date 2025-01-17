//
//  GetCurrentSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/17/25.
//


import AppIntents
import SwiftUI
import SwiftData
struct GetCurrentSessionIntent: AppIntent {
    @Dependency
    private var appState: AppState
    
    static var title: LocalizedStringResource = "Get current session"
    static var description = IntentDescription(
        "Get current session if user is in app",
        categoryName: "Session"
    )

    func perform() async throws -> some IntentResult & ReturnsValue<SessionEntity?> {
        guard let session = appState.currentSession else {
            return .result(value: nil)
        }

        return .result(value: SessionEntity(session: session))
    }
}
