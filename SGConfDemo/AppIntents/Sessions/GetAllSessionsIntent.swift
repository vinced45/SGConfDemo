//
//  GetAllSessionsIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct GetAllSessionsIntent: AppIntent {
    static var title: LocalizedStringResource = "Get All Sessions"
    static var description: IntentDescription = "Get All Sessions with details."
    static var openAppWhenRun: Bool = false

    func perform() async throws -> some IntentResult & ReturnsValue<[SessionEntity]?> {
        let sessions = await ConfSessionManager().fetchSessions().map({ SessionEntity(session: $0)})
        return .result(value: sessions)
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Get All Sessions")
    }
}
