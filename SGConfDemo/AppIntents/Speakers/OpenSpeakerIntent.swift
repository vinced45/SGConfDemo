//
//  OpenSpeakerIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct OpenSpeakerIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Speaker"
    static var description = IntentDescription(
        "Open speaker with details",
        categoryName: "Speaker"
    )
    static var openAppWhenRun: Bool = true

    @Parameter(title: "Speaker")
    var targetSpeaker: SpeakerEntity

    func perform() async throws -> some IntentResult {
        if !appState.path.isEmpty {
            appState.path.removeLast()
        }
        
        appState.path.append(targetSpeaker.id)
        return .result()
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Open \(\.$targetSpeaker)", table: "Select a speaker.")
    }
    
    @Dependency
    private var appState: AppState
}
