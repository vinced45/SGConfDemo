import AppIntents
import SwiftUI
import SwiftData

struct SpeakerQuery: EntityQuery {
    // Provide the list of options you want to show the user, when they select the Entity in the shortcut. You probably want to show all items you have from your array.
    func suggestedEntities() async throws -> [Speaker] {
        return await ConfSessionManager().fetchSpeakers()
    }
    
    func allEntities() async throws -> [Speaker] {
        return await ConfSessionManager().fetchSpeakers()
    }

    // Find Entity by id to bridge the Shortcuts Entity to your App
    func entities(for identifiers: [UUID]) async throws -> [Speaker] {
        return await ConfSessionManager().fetchSpeakers(with: identifiers)
    }
}