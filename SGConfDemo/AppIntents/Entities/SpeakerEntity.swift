//
//  SpeakerEntity.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//

import AppIntents
import SwiftUI

struct SpeakerEntity: AppEntity, Identifiable {
    var id: UUID
    
    var data: Speaker
    
    @Property(title: "Name")
    var name: String
    
    @Property(title: "Bio")
    var bio: String
    
    @Property(title: "Image")
    var image: URL
    
    init(speaker: Speaker) {
        self.data = speaker
        self.id = speaker.id
        self.name = speaker.name
        self.bio = speaker.bio
        self.image = URL(string: speaker.photoURL)!
    }
    
    // Visual representation e.g. in the dropdown, when selecting the entity.
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)",
                              subtitle: "\(bio)",
                              image: DisplayRepresentation.Image(named: name.split(separator: " ").first!.lowercased()))
    }

    // Placeholder whenever it needs to present your entity’s type onscreen.
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Speaker"
    static var defaultQuery = SpeakerQuery()
}
