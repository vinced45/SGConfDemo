//
//  LiveActivityManager.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import SwiftUI

struct LiveActivityManager {
    static func startLiveActivity(for session: ConfSession) {
        LiveActivityManager.startLiveActivity(
            id: session.id,
            sessionName: session.title,
            startTime: session.startTime,
            endTime: session.endTime,
            speaker: session.speaker?.name ?? "",
            imageUrl: session.speaker?.photoURL ?? "",
            isFavorite: session.isFavorite)
    }
    
    static func startLiveActivity(id: UUID, sessionName: String, startTime: Date, endTime: Date, speaker: String, imageUrl: String, isFavorite: Bool) {
        let attributes = SessionActivityAttributes()
        let fileName = "speaker-\(id.uuidString).jpg"

        Task {
            do {
                let success = try await ImageHelper.downloadAndSaveImage(urlString: imageUrl, fileName: fileName)
                if success {
                    let state = SessionActivityAttributes.ContentState(
                        sessionID: id,
                        sessionTitle: sessionName,
                        sessionStartTime: startTime,
                        sessionEndTime: endTime,
                        speakerName: speaker,
                        speakerImageFileName: fileName,
                        isFavorite: isFavorite
                    )

                    // I only want 1 Live Activity at a time for this Attribute
                    if LiveActivityManager.isLiveActivityActive() {
                        LiveActivityManager.updateLiveActivity(id: id,
                                                               sessionName: sessionName,
                                                               startTime: startTime,
                                                               endTime: endTime,
                                                               speaker: speaker,
                                                               imageUrl: imageUrl,
                                                               isFavorite: isFavorite)
                        return
                    }

                    do {
                        let _ = try Activity<SessionActivityAttributes>.request(
                            attributes: attributes,
                            contentState: state,
                            pushType: nil
                        )
                        print("Live Activity started!")
                    } catch {
                        print("Failed to start Live Activity: \(error)")
                    }
                }
            } catch {
                print("Failed to download and save image: \(error.localizedDescription)")
            }
        }
    }
    
    static func update(session: ConfSession) {
        LiveActivityManager.updateLiveActivity(id: session.id,
                                               sessionName: session.title,
                                               startTime: session.startTime,
                                               endTime: session.endTime,
                                               speaker: session.speaker?.name ?? "",
                                               imageUrl: session.speaker?.photoURL ?? "",
                                               isFavorite: session.isFavorite)
    }

    static func updateLiveActivity(id: UUID, sessionName: String, startTime: Date, endTime: Date, speaker: String, imageUrl: String, isFavorite: Bool) {
        guard LiveActivityManager.isLiveActivityActive() else { return }
        
        let fileName = "speaker-\(id.uuidString).jpg"
        
        Task {
            do {
                let success = try await ImageHelper.downloadAndSaveImage(urlString: imageUrl, fileName: fileName)
                if success {
                    let updatedContentState = SessionActivityAttributes.ContentState(
                        sessionID: id,
                        sessionTitle: "\(sessionName)",
                        sessionStartTime: startTime,
                        sessionEndTime: endTime,
                        speakerName: speaker,
                        speakerImageFileName: imageUrl,
                        isFavorite: isFavorite
                    )

                    for activity in Activity<SessionActivityAttributes>.activities {
                        await activity.update(using: updatedContentState)
                        print("Live Activity updated!")
                    }
                }
            } catch {
                print("Failed to download and save image: \(error.localizedDescription)")
            }
        }
    }

    static func endLiveActivity() {
        Task {
            for activity in Activity<SessionActivityAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
                print("Live Activity ended!")
            }
        }
    }
    
    static func isLiveActivityActive() -> Bool {
        for activity in Activity<SessionActivityAttributes>.activities {
            if activity.id != nil {
                return true
            }
        }
        return false
    }
}
