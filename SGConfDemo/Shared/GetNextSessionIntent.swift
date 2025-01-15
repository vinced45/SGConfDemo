import AppIntents
import SwiftData

struct GetNextSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Next Session"
    static var description: IntentDescription = "Fetches the next upcoming session in your schedule."

    func perform() async throws -> some IntentResult {
        // Fetch the next session from SwiftData
        let sessions = try await fetchSessions()
        guard let nextSession = sessions.sorted(by: { $0.startTime < $1.startTime }).first else {
            return .result(
                message: "You have no upcoming sessions.",
                intentResultDescription: "No upcoming sessions were found."
            )
        }

        return .result(
            message: "Your next session is '\(nextSession.title)', starting at \(nextSession.startTime.formatted()).",
            intentResultDescription: "Fetched details for the next session."
        )
    }

    // Helper to fetch sessions
    private func fetchSessions() async throws -> [ConfSession] {
        let fetchRequest = FetchRequest<ConfSession>(predicate: nil)
        return try await ModelContext.main.fetch(fetchRequest)
    }
}