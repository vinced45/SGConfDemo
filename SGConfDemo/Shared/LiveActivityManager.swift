//
//  LiveActivityManager.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import SwiftUI

struct LiveActivityManager {
    static func startLiveActivity(sessionName: String, startTime: Date, endTime: Date) {
        let attributes = SessionActivityAttributes(sessionName: sessionName)
        let initialContentState = SessionActivityAttributes.ContentState(
            sessionTitle: sessionName,
            sessionStartTime: startTime,
            sessionEndTime: endTime
        )

        do {
            let _ = try Activity<SessionActivityAttributes>.request(
                attributes: attributes,
                contentState: initialContentState,
                pushType: nil
            )
            print("Live Activity started!")
        } catch {
            print("Failed to start Live Activity: \(error)")
        }
    }

    static func updateLiveActivity(sessionName: String, startTime: Date, endTime: Date) {
        Task {
            let updatedContentState = SessionActivityAttributes.ContentState(
                sessionTitle: "\(sessionName) (Updated!)",
                sessionStartTime: startTime,
                sessionEndTime: endTime
            )

            for activity in Activity<SessionActivityAttributes>.activities {
                await activity.update(using: updatedContentState)
                print("Live Activity updated!")
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
}
