//
//  SpeakerDetailView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import SwiftUI

struct SpeakerDetailView: View {
    let speaker: Speaker
    let sessions: [ConfSession]
    
    init(speaker: Speaker, sessions: [ConfSession]) {
        self.speaker = speaker
        self.sessions = sessions
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                if let url = URL(string: speaker.photoURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(speaker.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center) // Center-align text
                
                Text("Biography")
                    .font(.headline)
                    .padding(.top)
                
                Text(speaker.bio)
                    .font(.body)
                    .multilineTextAlignment(.center) // Center-align text
                
                // Speaker's Sessions Section
                if sessions.count > 0 {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sessions")
                            .font(.headline)
                            .padding(.top)

                        ForEach(sessions, id: \.id) { session in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(session.title)
                                    .font(.headline)
                                Text("\(session.startTime.formatted(date: .abbreviated, time: .shortened)) - \(session.endTime.formatted(date: .omitted, time: .shortened))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text("No sessions available.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
                
                Spacer(minLength: 16) // Ensures some space at the bottom
            }
            .frame(maxWidth: .infinity) // Makes sure the content is centered horizontally
            .padding()
        }
        .navigationTitle("Speaker Details")
        .navigationBarTitleDisplayMode(.inline) // Keeps the title compact in the navigation bar
    }
}
