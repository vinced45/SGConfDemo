//
//  SGConfDemoWidgetLiveActivity.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SGConfDemoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SGConfDemoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SGConfDemoWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SGConfDemoWidgetAttributes {
    fileprivate static var preview: SGConfDemoWidgetAttributes {
        SGConfDemoWidgetAttributes(name: "World")
    }
}

extension SGConfDemoWidgetAttributes.ContentState {
    fileprivate static var smiley: SGConfDemoWidgetAttributes.ContentState {
        SGConfDemoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SGConfDemoWidgetAttributes.ContentState {
         SGConfDemoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SGConfDemoWidgetAttributes.preview) {
   SGConfDemoWidgetLiveActivity()
} contentStates: {
    SGConfDemoWidgetAttributes.ContentState.smiley
    SGConfDemoWidgetAttributes.ContentState.starEyes
}
