//
//  SessionActivityAttributes.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import ActivityKit
import SwiftUI

struct SessionActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var sessionTitle: String
        var sessionStartTime: Date
        var sessionEndTime: Date
    }

    var sessionName: String
}
