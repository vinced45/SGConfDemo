//
//  Item.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
