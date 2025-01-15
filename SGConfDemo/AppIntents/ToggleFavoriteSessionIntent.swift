import AppIntents

struct ToggleFavoriteSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Favorite Session"
    static var description = IntentDescription(
        "Toggles the favorite status of a given session.",
        categoryName: "Favorites"
    )

    @Parameter(title: "Session ID", description: "The ID of the session to toggle.")
    var sessionID: UUID

    func perform() async throws -> some IntentResult {
        guard let context = try? ModelContext(for: ConfSession.self) else {
            throw NSError(domain: "com.sgconf.demo", code: 1, userInfo: [NSLocalizedDescriptionKey: "ModelContext not available."])
        }

        // Fetch session by ID
        let sessions = try context.fetch(FetchDescriptor<ConfSession>())
        guard let session = sessions.first(where: { $0.id == sessionID }) else {
            throw NSError(domain: "com.sgconf.demo", code: 404, userInfo: [NSLocalizedDescriptionKey: "Session not found."])
        }

        // Toggle the favorite status
        session.isFavorite.toggle()
        try context.save()

        return .result(message: "\(session.title) is now \(session.isFavorite ? "favorited" : "unfavorited").")
    }
}