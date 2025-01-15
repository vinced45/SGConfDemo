//
//  LiveActivityView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/13/25.
//

import WidgetKit
import SwiftUI


public struct LiveActivityView: View {
    @Environment(\.activityFamily) var activityFamily
    public let session: SessionActivityAttributes
    
    public var body: some View {
        switch activityFamily {
        case .small: AnyView(watchView)
        case .medium: AnyView(iOSView)
        default: AnyView(iOSView)
        }
    }
    
    
}

// MARK: - Subviews
@available(iOS 16.2, *)
public extension LiveActivityView {
    @ViewBuilder
    var iOSView: some View {
        
    }
}
