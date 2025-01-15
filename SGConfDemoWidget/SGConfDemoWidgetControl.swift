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
        StaticControlConfiguration(
            kind: "com.vincedavis.sgdemo.startliveactivitycontrol"
        ) {
            ControlWidgetButton(action: StartSessionLiveActivityIntent()) {
                Label("Start Live Activity", systemImage: "bolt.fill")
            }
        }
        .displayName("Start Live Activity")
        .description("Start Live Activity")
    }
}
