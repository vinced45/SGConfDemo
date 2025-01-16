//
//  ConfSessionManager.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import Foundation
import SwiftData
import SwiftUI
import Observation

enum ConfSessionError: Error {
    case unexpected
    case unableToFetch
    case unableToSave
    case unableToFind
    case unableToCreateModelContext
}

fileprivate let modelContainer: ModelContainer = {
    let schema = Schema([
        ConfSession.self,
        Speaker.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()

@Observable
class ConfSessionManager {
    private var modelContext: ModelContext?

    init(modelContext: ModelContext? = nil) {
        if let context = modelContext {
            self.modelContext = context
        } else {
            self.modelContext = ModelContext(modelContainer)
        }
    }
}

// MARK: - Session Methods
extension ConfSessionManager {
    func fetchSessions() async -> [ConfSession] {
        return await fetchSwiftDataSessions()
    }
    
    func fetchSession(id: UUID) async throws -> ConfSession? {
        do {
            let sessions = try modelContext?.fetch(FetchDescriptor<ConfSession>())
            guard let session = sessions?.first(where: { $0.id == id }) else {
                throw ConfSessionError.unableToFind
            }
            return session
        } catch {
            throw ConfSessionError.unableToFetch
        }
    }
    
    func toggleFavorite(id: UUID) async throws {
        do {
            let sessions = try modelContext?.fetch(FetchDescriptor<ConfSession>())
            guard let session = sessions?.first(where: { $0.id == id }) else {
                throw ConfSessionError.unableToFind
            }
            session.isFavorite.toggle()
            try modelContext?.save()
        } catch {
            throw ConfSessionError.unableToFetch
        }
    }
    
    func toggleFavorite(for session: ConfSession) async throws {
        do {
            session.isFavorite.toggle()
            try modelContext?.save()
        } catch {
            throw ConfSessionError.unableToSave
        }
    }
    
    func fetchSessions(with identifiers: [UUID]) async -> [ConfSession] {
        let sessions = await fetchSwiftDataSessions()
        return sessions.compactMap { session in
            return identifiers.contains(session.id) ? session : nil
            
        }
    }

    /// Fetches sessions from SwiftData
    private func fetchSwiftDataSessions() async -> [ConfSession] {
        guard let modelContext else {
            print("ModelContext is not available.")
            return []
        }

        do {
            let fetchRequest = FetchDescriptor<ConfSession>() // Updated for SwiftData
            return try modelContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch sessions from SwiftData: \(error)")
            return []
        }
    }
    
    func getSession(before sessionID: UUID) async -> ConfSession? {
        let sessions = await fetchSwiftDataSessions().sorted(by: { $0.startTime < $1.startTime })
        
        guard let currentIndex = sessions.firstIndex(where: { $0.id == sessionID }),
              currentIndex > 0 else {
            return nil // No session before the current session
        }
        
        return sessions[currentIndex - 1]
    }
    
    func getSession(after sessionID: UUID) async -> ConfSession? {
        let sessions = await fetchSwiftDataSessions().sorted(by: { $0.startTime < $1.startTime })
        
        guard let currentIndex = sessions.firstIndex(where: { $0.id == sessionID }),
              currentIndex < sessions.count - 1 else {
            return nil // No session after the current session
        }
        
        return sessions[currentIndex + 1]
    }
}

// MARK: - Speaker Methods
extension ConfSessionManager {
    func fetchSpeakers() async -> [Speaker] {
        return await fetchSwiftDataSpeakers()
    }
    
    func fetchSpeaker(id: UUID) async throws -> Speaker? {
        do {
            let sessions = try modelContext?.fetch(FetchDescriptor<Speaker>())
            guard let session = sessions?.first(where: { $0.id == id }) else {
                throw ConfSessionError.unableToFetch
            }
            return session
        } catch {
            throw ConfSessionError.unableToFetch
        }
    }
    
    func fetchSpeakers(with identifiers: [UUID]) async -> [Speaker] {
        let speakers = await fetchSwiftDataSpeakers()
        return speakers.compactMap { speaker in
            return identifiers.contains(speaker.id) ? speaker : nil
            
        }
    }
    
    /// Fetches sessions from SwiftData
    private func fetchSwiftDataSpeakers() async -> [Speaker] {
        guard let modelContext else {
            print("ModelContext is not available.")
            return []
        }

        do {
            let fetchRequest = FetchDescriptor<Speaker>() // Updated for SwiftData
            return try modelContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch sessions from SwiftData: \(error)")
            return []
        }
    }
}
