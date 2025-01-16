//
//  SpeakCurrentSessionIntent.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/16/25.
//
import AppIntents
import SwiftUI
import SwiftData

struct SpeakCurrentSessionIntent: AppIntent {
    @Dependency
    private var appState: AppState
    
    static var title: LocalizedStringResource = "Speaks about current session"
    static var description = IntentDescription(
        "Speaks about current session",
        categoryName: "Session"
    )

    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard let session = appState.currentSession else {
            return .result(dialog: "There is no current session" )
        }
        
        return .result(dialog: "\(session.speaker?.name ?? "") session \(session.title) is about \(session.desc)")
    }
}
