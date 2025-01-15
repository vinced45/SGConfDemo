import AppIntents

struct SessionAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        [
            AppShortcut(
                intent: GetNextSessionIntent(),
                phrases: [
                    "Get next session in \(.applicationName)",
                    "What’s my next session in \(.applicationName)"
                ],
                shortTitle: "Next Session",
                systemImageName: "calendar"
            )
        ]
    }
}