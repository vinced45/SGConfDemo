//
//  Speaker.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import Foundation
import SwiftData

@Model
final class Speaker {
    @Attribute(.unique) var id: UUID
    var name: String
    var bio: String
    var photoURL: String // URL for speaker's photo

    init(id: UUID, name: String, bio: String, photoURL: String) {
        self.id = id
        self.name = name
        self.bio = bio
        self.photoURL = photoURL
    }
}

extension Speaker: Identifiable, Sendable {}
