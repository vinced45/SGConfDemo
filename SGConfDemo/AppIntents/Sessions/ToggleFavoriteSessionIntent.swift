//
//  ToggleFavoriteSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//


import AppIntents
import SwiftData
import SwiftUI

struct ToggleFavoriteSessionIntent: AppIntent, LiveActivityIntent {
    init() {
        self.sessionID = ""
    }
    
    init (sessionID: String) {
        self.sessionID = sessionID
    }
    
    static var title: LocalizedStringResource = "Toggle Favorite Session"
    static var description = IntentDescription(
        "Toggles the favorite status of a given session.",
        categoryName: "Favorites"
    )

    var sessionID: String

    func perform() async throws -> some IntentResult {
        // Fetch session by ID
        let manager = ConfSessionManager()
        let id = UUID(uuidString: sessionID) ?? UUID()
        try await manager.toggleFavorite(id: id)
        
        if let session = try await manager.fetchSession(id: id),
           LiveActivityManager.isLiveActivityActive() {
            LiveActivityManager.update(session: session)
        }
        //return .result(value: "\(session.title) is now \(session.isFavorite ? "favorited" : "unfavorited").")
        return .result()
    }
}
