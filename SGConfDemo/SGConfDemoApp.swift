//
//  SGConfDemoApp.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import SwiftUI
import SwiftData
import AppIntents

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

@main
struct SGConfDemoApp: App {
    init() {
        let appSessionState = AppState()
        self.appState = appSessionState
        AppDependencyManager.shared.add(dependency: appSessionState)
    }
    
    @State private var appState: AppState

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    guard url.scheme == "sgconf" else { return }
                    print(url.lastPathComponent)
                    guard let id = UUID(uuidString: url.lastPathComponent) else { return }
                    if appState.path.count > 0 {
                        appState.clear()
                    }
                    appState.path.append(id)
                }
                .environment(appState)
        }
        .modelContainer(modelContainer)
    }

}
