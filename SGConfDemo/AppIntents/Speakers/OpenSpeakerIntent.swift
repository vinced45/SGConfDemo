import AppIntents
import SwiftUI
import SwiftData

struct OpenSpeakerIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Speaker"
    static var description: IntentDescription = "Open speaker with details."
    static var openAppWhenRun: Bool = true

    @Parameter(title: "Speaker")
    var targetSpeaker: Speaker

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