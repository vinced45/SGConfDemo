//
//  SessionDetailView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//


import SwiftUI

struct SessionDetailView: View {
    let session: Session

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(session.title)
                .font(.largeTitle)
                .bold()
            Text("Start: \(session.startTime, format: .dateTime.hour().minute())")
            Text("End: \(session.endTime, format: .dateTime.hour().minute())")
            Text(session.description)
                .font(.body)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Session Details")
    }
}

#Preview {
    SessionDetailView(session: Session(
        id: UUID(),
        title: "Demo Session",
        startTime: Date(),
        endTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!,
        description: "This is a detailed description of the demo session."
    ))
}