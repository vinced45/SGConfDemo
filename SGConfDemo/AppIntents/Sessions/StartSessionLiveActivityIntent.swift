//
//  StartSessionLiveActivityIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/16/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct StartSessionLiveActivityIntent: AppIntent, LiveActivityIntent {
    static var title: LocalizedStringResource = "Start Session Live Activity "
    static var description = IntentDescription(
        "Starts the session live activity",
        categoryName: "Session"
    )
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Session")
    var targetSession: SessionEntity

    func perform() async throws -> some IntentResult {
        LiveActivityManager.startLiveActivity(for: targetSession.data)
        return .result()
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Start Live Activity for \(\.$targetSession) Session", table: "Select a Session.")
    }
}
