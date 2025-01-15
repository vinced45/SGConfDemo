import Foundation
import SwiftData

class ConfSessionManager {
    private var useMockData: Bool
    private var mockData: [ConfSession]

    init(useMockData: Bool = false) {
        self.useMockData = useMockData
        self.mockData = MockData.sessions // Replace with your mock data source
    }

    /// Fetches sessions based on the mode (SwiftData or MockData)
    func fetchSessions() async -> [ConfSession] {
        if useMockData {
            return fetchMockSessions()
        } else {
            return await fetchSwiftDataSessions()
        }
    }

    /// Fetches mock sessions
    private func fetchMockSessions() -> [ConfSession] {
        return mockData
    }

    /// Fetches sessions from SwiftData
    private func fetchSwiftDataSessions() async -> [ConfSession] {
        do {
            let fetchRequest = FetchRequest<ConfSession>(predicate: nil)
            return try await ModelContext.main.fetch(fetchRequest)
        } catch {
            print("Failed to fetch sessions from SwiftData: \(error)")
            return []
        }
    }

    /// Adds a new session to the data source
    func addSession(_ session: ConfSession) async {
        guard !useMockData else {
            print("Mock mode enabled, changes won't be saved.")
            return
        }

        do {
            let modelContext = ModelContext.main
            try await modelContext.perform {
                modelContext.insert(session)
                try modelContext.save()
            }
        } catch {
            print("Failed to add session to SwiftData: \(error)")
        }
    }

    /// Deletes a session from the data source
    func deleteSession(_ session: ConfSession) async {
        guard !useMockData else {
            print("Mock mode enabled, changes won't be saved.")
            return
        }

        do {
            let modelContext = ModelContext.main
            try await modelContext.perform {
                modelContext.delete(session)
                try modelContext.save()
            }
        } catch {
            print("Failed to delete session from SwiftData: \(error)")
        }
    }
}