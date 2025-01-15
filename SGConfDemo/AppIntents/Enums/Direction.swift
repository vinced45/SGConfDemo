//
//  Direction.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import AppIntents

enum Direction: String, AppEnum {
    case before
    case after
    
    static let typeDisplayRepresentation = TypeDisplayRepresentation(name: "Direction")
        static let caseDisplayRepresentations: [Self: DisplayRepresentation] = [
            .before: "Before",
            .after: "After"
        ]
}
