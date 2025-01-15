//
//  NavigationModel.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//
import SwiftData
import Observation
import SwiftUI

@Observable
class NavigationModel: ObservableObject {
    var path: NavigationPath = .init()
    var currentSession: ConfSession?
    var currentSpeaker: Speaker?
    
    func clear() {
        currentSession = nil
        currentSpeaker = nil
    }
}
