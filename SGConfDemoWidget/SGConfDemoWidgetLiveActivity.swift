//
//  SGConfDemoWidgetLiveActivity.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import WidgetKit
import SwiftUI
import AppIntents

struct SGConfDemoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SessionActivityAttributes.self) { context in
            // Lock Screen and Expanded View
            LiveActivitySessionView(session: context.attributes,
                                    state: context.state
            )
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    LiveActivitySessionView(session: context.attributes,
                                            state: context.state
                    )
                    .dynamicLeading
                }
                DynamicIslandExpandedRegion(.trailing) {
                    LiveActivitySessionView(session: context.attributes,
                                            state: context.state
                    )
                    .dynamicTrailing
                }
                DynamicIslandExpandedRegion(.center) {
                    LiveActivitySessionView(session: context.attributes,
                                            state: context.state
                    )
                    .dynamicCenter
                }
                DynamicIslandExpandedRegion(.bottom) {
                    LiveActivitySessionView(session: context.attributes,
                                            state: context.state
                    )
                    .dynamicBottom
                }
            } compactLeading: {
                LiveActivitySessionView(session: context.attributes,
                                        state: context.state
                )
                .compactLeading
            } compactTrailing: {
                LiveActivitySessionView(session: context.attributes,
                                        state: context.state
                )
                .compactTrailing
            } minimal: {
                LiveActivitySessionView(session: context.attributes,
                                        state: context.state
                )
                .minimal
            }
            .widgetURL(
                URL(string: "sgconf://sessions/\(context.state.sessionID.uuidString)")
            )
        }
        .supplementalActivityFamilies([.small, .medium])
    }
}

extension SessionActivityAttributes {
    fileprivate static var preview: SessionActivityAttributes {
        SessionActivityAttributes()
    }
}

extension SessionActivityAttributes.ContentState {
    fileprivate static var techniques: SessionActivityAttributes.ContentState {
        SessionActivityAttributes.ContentState(
            sessionID: UUID(),
            sessionTitle: "Exploring Advanced Techniques",
            sessionStartTime: Date(),
            sessionEndTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, 
            speakerName: "Vince",
            speakerImageFileName: "",
            isFavorite: false
        )
     }
}

#Preview("Notification", as: .content, using: SessionActivityAttributes.preview) {
    SGConfDemoLiveActivity()
} contentStates: {
    SessionActivityAttributes.ContentState.techniques
}
