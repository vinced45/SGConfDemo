//
//  ContentView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import SwiftUI
import SwiftData
import AppIntents

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \ConfSession.startTime) private var sessions: [ConfSession]
    @Query(sort: \Speaker.name) private var speakers: [Speaker]
    
    let liveActivityLink: UUID = .init()
    
    var body: some View {
        @Bindable var appState = appState
        NavigationStack(path: $appState.path) {
            // Sidebar with a list of conference sessions
            List {
                favoriteSection
                
                scheduleSection
                
                speakerSection
                
                liveActivitySection
                
                shortcutsSection
            }
            .navigationDestination(for: UUID.self) { id in
                handleNavigationLinkValue(id)
            }
            .navigationTitle("SG Conf '25")
            .toolbarBackground(Style.orange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar) // Ensures the background is visible
            .toolbarColorScheme(.light, for: .navigationBar)
        }
        .onAppear {
            MockData().seedMockDataIfNeeded(using: modelContext)
        }
        .onChange(of: appState.path) { newpath in
            print("path count: \(newpath.count)")
            if newpath.count == 0 {
                appState.clear()
            }
        }
    }
}

// MARK: - Private Methods
extension ContentView {
    private func toggleFavorite(for session: ConfSession) {
        if let index = sessions.firstIndex(where: { $0.id == session.id }) {
            withAnimation {
                sessions[index].isFavorite.toggle()
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving changes: \(error)")
            }
        }
    }
    
    @ViewBuilder
    private func handleNavigationLinkValue(_ value: UUID) -> some View {
        if let session = sessions.first(where: { $0.id == value }) {
            ConfSessionDetailView(session: session)
                .environment(appState)
        } else if let speaker = speakers.first(where: { $0.id == value }) {
            SpeakerDetailView(speaker: speaker,
                              sessions: sessions.filter({$0.speaker == speaker }))
        } else if value == liveActivityLink {
            LiveActivityPreviewView()
        } else {
            Text("Item not found.")
                .font(.title2)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - List Sections
extension ContentView {
    @ViewBuilder
    var favoriteSection: some View {
        Section(header: Text("Favorites").font(.title2).bold()) {
            let favoriteSessions = sessions.filter { $0.isFavorite }
            if favoriteSessions.isEmpty {
                Text("No favorite sessions yet.")
                    .foregroundColor(.secondary)
            } else {
                ForEach(favoriteSessions, id: \.id) { session in
                    NavigationLink(value: session.id) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(session.title)
                                .font(.headline)
                            Text("Speaker: \(session.speaker?.name ?? "Unknown")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var scheduleSection: some View {
        Section(header: Text("Schedule").font(.title2).bold()) {
            SiriTipView(intent: OpenSessionIntent(), isVisible: .constant(true))
                .listRowBackground(Color.clear)
            
            ForEach(sessions, id: \.id) { session in
                NavigationLink(
                    value: session.id,
                    label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(session.title)
                                    .font(.headline)
                                
                                HStack {
                                    AsyncImage(url: URL(string: session.speaker?.photoURL ?? "")) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 30, height: 30)
                                    }
                                    Text(session.speaker?.name ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Text("\(session.startTime.formatted(date: .abbreviated, time: .shortened)) - \(session.endTime.formatted(date: .omitted, time: .shortened))")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            //.padding(.vertical, 4)
                            
                            Spacer()
                            
                            // Favorite Button
                            Button(action: {
                                toggleFavorite(for: session)
                            }) {
                                Image(systemName: session.isFavorite ? "star.fill" : "star")
                                    .foregroundColor(session.isFavorite ? .yellow : .gray)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                )
            }
        }
    }
    
    @ViewBuilder
    var speakerSection: some View {
        Section(header: Text("Speakers").font(.title2).bold()) {
            SiriTipView(intent: OpenSpeakerIntent(), isVisible: .constant(true))
                .listRowBackground(Color.clear)
            
            ForEach(speakers, id: \.id) { speaker in
                NavigationLink(
                    value: speaker.id,
                    label: {
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: speaker.photoURL)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 50, height: 50)
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(speaker.name)
                                    .font(.headline)
                                Text(speaker.bio)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                )
            }
        }
    }
    
    @ViewBuilder
    var liveActivitySection: some View {
        Section(header: Text("Live Activities").font(.title2).bold()) {
            NavigationLink(
                value: liveActivityLink,
                label: {
                    Label("Live Activity Preview", systemImage: "bolt.square")
                        .font(.headline)
                        .padding(.vertical, 4)
                }
            )
        }
    }
    
    @ViewBuilder
    var shortcutsSection: some View {
        HStack {
            Spacer()
            /// `ShortcutsLink` opens this app's page in the Shortcuts app, so the user can see all of the App Shortcuts the app provides.
            ShortcutsLink()
                .shortcutsLinkStyle(.automatic)
            
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    // Use mock data in the preview
    ContentView()
        .modelContainer(for: ConfSession.self, inMemory: true)
}
