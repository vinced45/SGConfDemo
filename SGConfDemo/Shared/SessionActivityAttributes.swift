//
//  SessionActivityAttributes.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import SwiftUI

public struct SessionActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var sessionID: UUID
        var sessionTitle: String
        var sessionStartTime: Date
        var sessionEndTime: Date
        var speakerName: String
        var speakerImageFileName: String
        var isFavorite: Bool
    }
    var type: String = "sessionActivity"
}
