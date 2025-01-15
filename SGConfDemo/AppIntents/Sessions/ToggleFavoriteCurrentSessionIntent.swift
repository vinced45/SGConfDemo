import AppIntents
import SwiftUI
import SwiftData

struct ToggleFavoriteCurrentSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle favorite for current session"
    static var description: IntentDescription = "Toggle favorite for current session"
    
//    @Parameter(title: "Session")
//    var targetSession: ConfSession

    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard let session = appState.currentSession else {
            return .result(dialog: "There is no current session" )
        }
        let intent = ToggleFavoriteSessionIntent(sessionID: session.id.uuidString)
        do {
            try await intent.perform()
        }
        
        return .result(dialog: "Session \(session.title) is now \(session.isFavorite ? "favorite" : "not favorite")")
    }
    
    @Dependency
    private var appState: AppState
}
