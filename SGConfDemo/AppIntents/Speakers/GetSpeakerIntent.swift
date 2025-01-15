//
//  GetSpeakerIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct GetSpeakerIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Speaker"
    static var description = IntentDescription(
        "Get Speaker with details",
        categoryName: "Speaker"
    )
    static var openAppWhenRun: Bool = false

    @Parameter(title: "Speaker")
    var targetSpeaker: SpeakerEntity

    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView & ReturnsValue<SpeakerEntity?> {
        return .result(value: targetSpeaker,
                       dialog: "\(targetSpeaker.name) is \(targetSpeaker.bio) ")
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Get \(\.$targetSpeaker)", table: "Select a speaker.")
    }
    
    @Dependency
    private var appState: AppState
}


