struct SessionQuery: EntityQuery {
    // Provide the list of options you want to show the user, when they select the Entity in the shortcut. You probably want to show all items you have from your array.
    func suggestedEntities() async throws -> [SessionEntity] {
        return await ConfSessionManager().fetchSessions()
                        //.filter({$0.isFavorite == true})
                        .map({ SessionEntity(session: $0)})
    }
    
    func allEntities() async throws -> [SessionEntity] {
        return await ConfSessionManager().fetchSessions()
                        .map({ SessionEntity(session: $0)})
    }

    // Find Entity by id to bridge the Shortcuts Entity to your App
    func entities(for identifiers: [UUID]) async throws -> [SessionEntity] {
        return await ConfSessionManager().fetchSessions(with: identifiers)
                        .map({ SessionEntity(session: $0)})
    }
}