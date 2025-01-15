struct GetSpeakerIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Speaker"
    static var description: IntentDescription = "Get speaker with details."
    static var openAppWhenRun: Bool = false

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