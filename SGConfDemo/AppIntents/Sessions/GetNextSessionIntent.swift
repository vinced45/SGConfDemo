//
//  GetNextSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import AppIntents
import SwiftUI
import SwiftData

struct GetNextSessionIntent: AppIntent, LiveActivityIntent {
    static var title: LocalizedStringResource = "Get Next Session"
    static var description = IntentDescription("Fetches the session before or after the current one", categoryName: "Session"
    )
    
    @Parameter(title: "Session")
    var targetSession: SessionEntity
    
    @Parameter(title: "Direction")
    var direction: Direction
    
    init() {
        self.targetSession = SessionEntity(session: .bulidingHyper)
        self.direction = .before
    }
    
    init (entity: SessionEntity, direction: Direction) {
        self.targetSession = entity
        self.direction = direction
    }

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let sessionManager = ConfSessionManager()
        var session: ConfSession
        var dialog: String
        switch direction {
            case .before:
            guard let previousSession = await sessionManager.getSession(before: targetSession.id) else {
                return .result(
                    dialog: "There is no session before this one."
                )
            }
            dialog = "Your previous session was '\(previousSession.title)', starting at \(previousSession.startTime.formatted())."
            session = previousSession
            case .after:
            guard let nextSession = await sessionManager.getSession(after: targetSession.id) else {
                return .result(
                    dialog: "There is no session after this one."
                )
            }
            dialog = "Your next session is '\(nextSession.title)', starting at \(nextSession.startTime.formatted())."
            session = nextSession
        }
        LiveActivityManager.update(session: session)
        
        return .result(dialog: IntentDialog(stringLiteral: dialog))
    }
}


