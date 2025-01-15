//
//  OpenSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct OpenSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Session"
    static var description = IntentDescription(
        "Open Session with details",
        categoryName: "Session"
    )
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Session")
    var targetSession: SessionEntity

    func perform() async throws -> some IntentResult {
        if !appState.path.isEmpty {
            appState.path.removeLast()
        }
        appState.path.append(targetSession.id)
        
        return .result()
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Open \(\.$targetSession)", table: "Select a Session.")
    }
    
    
    
    @Dependency
    private var appState: AppState
}
