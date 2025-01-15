//
//  SessionAppShortcuts.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import AppIntents

struct SessionAppShortcuts: AppShortcutsProvider {
    /// The color the system uses to display the App Shortcuts in the Shortcuts app.
    static let shortcutTileColor = ShortcutTileColor.orange
    
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenSpeakerIntent(),
            phrases: [
                "Open Speaker for \(.applicationName)",
                "Show Speaker \(\.$targetSpeaker) for \(.applicationName)",
            ],
            shortTitle: "Open Speaker",
            systemImageName: "person.fill"
        )
        
        AppShortcut(
            intent: ToggleFavoriteCurrentSessionIntent(),
            phrases: [
                "Favorite this session for \(.applicationName)"
            ],
            shortTitle: "Favorite Session",
            systemImageName: "star"
        )
        
        AppShortcut(
            intent: OpenSessionIntent(),
            phrases: [
                "Show Session for \(.applicationName)",
                "Open \(\.$targetSession) Session for \(.applicationName)",
            ],
            shortTitle: "Open Session",
            systemImageName: "music.microphone"
        )
        
        AppShortcut(
            intent: GetSessionIntent(),
            phrases: [
                "Get session in \(.applicationName)"
            ],
            shortTitle: "Get Session",
            systemImageName: "calendar"
        )
        
        AppShortcut(
            intent: GetNextSessionIntent(),
            phrases: [
                "Get next session in \(.applicationName)",
                "What’s my next session in \(.applicationName)"
            ],
            shortTitle: "Next Session",
            systemImageName: "calendar"
        )
    }
}
