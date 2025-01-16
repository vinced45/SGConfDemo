//
//  SGConfDemoWidget.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

//
//  SGConfDemoWidget.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), id: UUID(), sessionTitle: "Sample Session", speakerName: "John Doe", startTime: Date(), isFavorite: true)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let session = await ConfSessionManager().fetchSessions().first
        return SimpleEntry(
            date: Date(),
            id: session?.id ?? UUID(),
            sessionTitle: session?.title ?? "No Sessions",
            speakerName: session?.speaker?.name ?? "Unknown Speaker",
            startTime: session?.startTime ?? Date(),
            isFavorite: session?.isFavorite ?? false
        )
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        let currentDate = Date()

        for hourOffset in 0 ..< 5 {
            let session = await ConfSessionManager().fetchSessions().first
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(
                date: entryDate,
                id: session?.id ?? UUID(),
                sessionTitle: session?.title ?? "No Sessions",
                speakerName: session?.speaker?.name ?? "Unknown Speaker",
                startTime: session?.startTime ?? Date(),
                isFavorite: session?.isFavorite ?? false
            )
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

    private func fetchNextSession() async -> ConfSession? {
        // Use the GetNextSessionIntent to fetch the next session
        let intent = GetNextSessionIntent()
        let result = try? await intent.perform()
        return .bulidingHyper
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let id: UUID
    let sessionTitle: String
    let speakerName: String
    let startTime: Date
    let isFavorite: Bool
}

struct SGConfDemoWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header
            Text("Next Session")
                .font(.headline)
                .bold()
                .foregroundColor(.blue)
                .padding(.bottom, 4)

            // Session Title
            Text(entry.sessionTitle)
                .font(.title3)
                .bold()
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            // Session Details in Two Columns
            HStack(alignment: .top, spacing: 8) {
                // Left Column: Icons
                VStack(alignment: .leading, spacing: 6) {
                    Image(entry.speakerName.split(separator: " ").first!.lowercased())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Image(systemName: "clock.fill")
                        .foregroundColor(.orange)
                }

                // Right Column: Text Details
                VStack(alignment: .leading, spacing: 6) {
                    Text(entry.speakerName)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(height: 30)
                    Text(entry.startTime, style: .time)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Favorite Button
                Button(intent: ToggleFavoriteSessionIntent(sessionID: entry.id.uuidString)) {
                    Image(systemName: entry.isFavorite ? "star.fill" : "star")
                        .foregroundColor(entry.isFavorite ? .yellow : .gray)
                }
            }
        }
        .padding()
    }
}

struct SGConfDemoWidget: Widget {
    let kind: String = "SGConfDemoWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            SGConfDemoWidgetEntryView(entry: entry)
        }
    }
}

#Preview(as: .systemSmall) {
    SGConfDemoWidget()
} timeline: {
    SimpleEntry(
        date: .now,
        id: UUID(),
        sessionTitle: "Advanced SwiftUI",
        speakerName: "Paul Hudson",
        startTime: Date().addingTimeInterval(3600),
        isFavorite: true
    )
}
