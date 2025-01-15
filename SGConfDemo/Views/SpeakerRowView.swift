//
//  SpeakerRowView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import SwiftUI

struct SpeakerRowView: View {
    var speaker: Speaker
    
    var body: some View {
        HStack(spacing: 16) {
            Image(speaker.name.split(separator: " ").first!.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
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
}

#Preview {
    SpeakerRowView(speaker: .vince)
}
