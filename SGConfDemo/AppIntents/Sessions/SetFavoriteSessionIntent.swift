//
//  SetFavoriteSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/16/25.
//
import AppIntents
import SwiftUI
import SwiftData
import WidgetKit

struct SetFavoriteSessionIntent: AppIntent, LiveActivityIntent {
    static var title: LocalizedStringResource = "Set Favorite Session"
    static var description = IntentDescription("Set Favorite Session", categoryName: "Session"
    )
    static var isDiscoverable: Bool = false
    
    @Parameter(title: "Session")
    var targetSession: SessionEntity
    
    init() {
        self.targetSession = SessionEntity(session: .bulidingHyper)
    }
    
    init (entity: SessionEntity) {
        self.targetSession = entity
    }

    func perform() async throws -> some IntentResult {
        let sessionManager = ConfSessionManager()
        _ = try await ToggleFavoriteSessionIntent(sessionID: targetSession.data.id.uuidString).perform()
        if let updatedSession = try await sessionManager.fetchSession(id: targetSession.data.id) {
            if LiveActivityManager.isLiveActivityActive() {
                LiveActivityManager.update(session: updatedSession)
            }
            WidgetCenter.shared.reloadAllTimelines()
        }
        
        return .result()
    }
}
