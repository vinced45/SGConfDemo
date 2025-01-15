//
//  SessionRowView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//

import SwiftUI

struct SessionRowView: View {
    var session: ConfSession
    
    var body: some View {
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
                        Image(session.speaker!.name.split(separator: " ").first!.lowercased())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
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
            Button(intent: ToggleFavoriteSessionIntent(sessionID: session.id.uuidString)) {
                Image(systemName: session.isFavorite ? "star.fill" : "star")
                    .foregroundColor(session.isFavorite ? .yellow : .gray)
            }
        }
        .padding()
    }
}

#Preview {
    SessionRowView(session: .levelupPart1)
}


