//
//  SessionEntity.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//

import AppIntents
import SwiftUI

struct SessionEntity: AppEntity, Identifiable {
    var id: UUID
    
    var data: ConfSession
    
    @Property(title: "Name")
    var name: String
    
    @Property(title: "Description")
    var description: String
    
    @Property(title: "Start Time")
    var startTime: Date
    
    @Property(title: "End Time")
    var endTime: Date
    
    @Property(title: "Speaker")
    var speaker: String
    
    init(session: ConfSession) {
        self.data = session
        self.id = session.id
        self.name = session.title
        self.startTime = session.startTime
        self.description = session.desc
        self.speaker = session.speaker?.name ?? ""
        self.endTime = session.endTime
    }
    
    // Visual representation e.g. in the dropdown, when selecting the entity.
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)",
                              subtitle: "\(speaker)",
                              image: DisplayRepresentation.Image(named: speaker.split(separator: " ").first!.lowercased()))
    }

    // Placeholder whenever it needs to present your entity’s type onscreen.
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Session"
    static var defaultQuery = SessionQuery()
}
