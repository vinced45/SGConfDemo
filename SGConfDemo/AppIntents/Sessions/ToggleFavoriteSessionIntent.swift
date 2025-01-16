//
//  ToggleFavoriteSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//


import AppIntents
import SwiftData
import SwiftUI
import WidgetKit

struct ToggleFavoriteSessionIntent: AppIntent, LiveActivityIntent {
    var sessionID: String
    
    init() {
        self.sessionID = ""
    }
    
    init (sessionID: String) {
        self.sessionID = sessionID
    }
    
    static var title: LocalizedStringResource = "Toggle Favorite Session"
    static var description = IntentDescription(
        "Toggles the favorite status of a given session.",
        categoryName: "Session"
    )

    func perform() async throws -> some IntentResult {
        // Fetch session by ID
        let manager = ConfSessionManager()
        let id = UUID(uuidString: sessionID) ?? UUID()
        guard let session = try await manager.fetchSession(id: id) else {
            return .result()
        }
        try await manager.toggleFavorite(for: session)
        
        if LiveActivityManager.isLiveActivityActive() {
            LiveActivityManager.update(session: session)
        }
        
        WidgetCenter.shared.reloadAllTimelines()

        return .result()
    }
}
