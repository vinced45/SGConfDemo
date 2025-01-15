//
//  SGConfDemoWidgetControl.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import AppIntents
import SwiftUI
import WidgetKit

//struct OpenSessionConfiguration: WidgetConfigurationIntent {
//    static var title: LocalizedStringResource = "Open Session"
//    
//    @Parameter(title: "Session")
//    var session: SessionEntity?
//    
//    func perform() async throws -> some IntentResult {
//        return .result()
//    }
//}
//extension OpenSessionConfiguration: ControlConfigurationIntent {}
//
//struct OpenSessionControl: ControlWidget {
//    var body: some ControlWidgetConfiguration {
//        AppIntentControlConfiguration(
//            kind: "com.example.OpenSession",
//            intent: OpenSessionIntent.self
//        ) { config in
//            ControlWidgetButton(action: config) {
//                Image(systemName:"calendar")
//                Text("Open Session")
//            }
//        }
//    }
//}
