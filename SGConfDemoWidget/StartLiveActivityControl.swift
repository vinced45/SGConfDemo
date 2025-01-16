//
//  SGConfDemoWidgetControl.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import AppIntents
import SwiftUI
import WidgetKit

struct StartLiveActivityControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: "com.vincedavis.sgdemo.startliveactivitycontrol",
            intent: StartSessionLiveActivityIntent.self
        ) { configuration in
            ControlWidgetButton(action: configuration) {
                Label(configuration.targetSession?.data.speaker?.name ?? "", systemImage: "bolt.fill")
            }
        }
        .displayName("Start Live Activity")
        .description("Start Live Activity for given session")
    }
}

extension StartSessionLiveActivityIntent: ControlConfigurationIntent {}
