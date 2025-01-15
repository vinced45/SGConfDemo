//
//  GetSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct GetSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Session"
    static var description = IntentDescription(
        "Get session with details",
        categoryName: "Session"
    )
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Session")
    var targetSession: SessionEntity

    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView & ReturnsValue<SessionEntity?> {
        return .result(value: targetSession,
                       dialog: "The session \(targetSession.name) is on \(targetSession.startTime.formatted(date: .abbreviated, time: .omitted)) and starts at \(targetSession.startTime.formatted(date: .omitted, time: .shortened))",
                       view: SessionRowView(session: targetSession.data))
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Get \(\.$targetSession)", table: "Select a Session.")
    }
}


