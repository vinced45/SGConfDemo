//
//  LiveActivityWidget.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//
import Foundation
import SwiftUI

enum LiveActivityWidget {
    case dynamicIslandCompactSmall
    case dynamicIslandCompactLarge
    case dynamicIslandMinimalSmall
    case dynamicIslandMinimalLarge
    case iphoneSmall
    case iphoneLarge
    case ipadSmall
    case ipadLarge
    case watch40mm
    case watch41mm
    case watch44mm
    case watch45mm
    case watch49mm

    static var allCases: [LiveActivityWidget] {
        [
                //.dynamicIslandCompactSmall,
                .dynamicIslandCompactLarge,
                //.dynamicIslandMinimalSmall,
                .dynamicIslandMinimalLarge,
                .iphoneSmall,
                //.iphoneLarge,
                //.ipadSmall,
                //.ipadLarge,
                .watch40mm,
                //.watch41mm,
                .watch44mm,
                //.watch45mm,
                .watch49mm
        ]
    }

    static var lightCases: [LiveActivityWidget] {
        [
                //.iphoneLarge,
                .ipadSmall,
                //.ipadLarge,
                .watch40mm,
                //.watch41mm,
                .watch44mm,
                //.watch45mm,
                .watch49mm
        ]
    }

    var title: String {
        switch self {
        case .dynamicIslandCompactSmall: return "Compact Small"
        case .dynamicIslandCompactLarge: return "Compact Large"
        case .dynamicIslandMinimalSmall: return "Minimal Small"
        case .dynamicIslandMinimalLarge: return " Minimal Large"
        case .iphoneSmall: return "iPhone Small"
        case .iphoneLarge: return "iPhone Large"
        case .ipadSmall: return "iPad Large"
        case .ipadLarge: return "iPad Large"
        case .watch40mm: return "Watch 40mm"
        case .watch41mm: return "Watch 41mm"
        case .watch44mm: return "Watch 44mm"
        case .watch45mm: return "Watch 45mm"
        case .watch49mm: return "Watch 49mm"
        }
    }

    var size: CGSize {
        switch self {
        case .iphoneSmall: return .init(width: 371, height: 160)
        case .iphoneLarge: return .init(width: 408, height: 160)
        case .ipadSmall: return .init(width: 425, height: 160)
        case .ipadLarge: return .init(width: 500, height: 160)
        case .watch40mm: return .init(width: 304/2, height: 139/2)
        case .watch41mm: return .init(width: 330/2, height: 145/2)
        case .watch44mm: return .init(width: 346/2, height: 153/2)
        case .watch45mm: return .init(width: 368/2, height: 161/2)
        case .watch49mm: return .init(width: 382/2, height: 163/2)
        case .dynamicIslandCompactSmall: return .init(width: 52.33/2, height: 36.67)
        case .dynamicIslandCompactLarge: return .init(width: 62.33/2, height: 36.67)
        case .dynamicIslandMinimalSmall: return .init(width: 45/2, height: 36.67)
        case .dynamicIslandMinimalLarge: return .init(width: 45/2, height: 36.6)
        }
    }
}
