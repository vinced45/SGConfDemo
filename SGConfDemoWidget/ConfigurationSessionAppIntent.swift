//
//  AppIntent.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import WidgetKit
import AppIntents

struct ConfigurationSessionAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Session" }
    static var description: IntentDescription { "Setup a session" }

    @Parameter(title: "Session")
    var targetSession: SessionEntity?
}
