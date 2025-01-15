//
//  LiveActivityView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/13/25.
//

import WidgetKit
import SwiftUI
import AppIntents

public struct LiveActivitySessionView: View {
    @Environment(\.activityFamily) var activityFamily
    @Environment(\.colorScheme) var colorScheme
    
    public let session: SessionActivityAttributes
    public let state: SessionActivityAttributes.ContentState
    
    public var body: some View {
        switch activityFamily {
        case .small: AnyView(watchView)
        case .medium: AnyView(phoneView)
        default: AnyView(phoneView)
        }
    }
}

// MARK: - Subviews
@available(iOS 16.2, *)
public extension LiveActivitySessionView {
    @ViewBuilder
    var phoneView: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                if let image = ImageHelper.loadImage(fileName: state.speakerImageFileName) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else if let asset = state.speakerName.split(separator: " ").first {
                    Image(asset.lowercased())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                }
                
                Spacer()
                
                Button(intent: GetNextSessionIntent(entity: getEntity(), direction: Direction.before), label: {
                    Image(systemName: "arrowshape.left")
                })
            }
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(state.sessionTitle)
                    .font(.headline)
                    .bold()
                Text("\(state.sessionStartTime, style: .date)  \(state.sessionStartTime, style: .time) \(state.sessionEndTime, style: .time)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("Starts in \(Text(state.sessionStartTime, style: .relative))")
                    .font(.headline)
                    .bold()
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Button(intent: ToggleFavoriteSessionIntent(sessionID: state.sessionID.uuidString), label: {
                    Image(systemName: state.isFavorite ? "star.fill" : "star")
                        .foregroundColor(state.isFavorite ? .yellow : .gray)
                })
                
                Spacer()
                
                Button(intent: GetNextSessionIntent(entity: getEntity(), direction: Direction.after), label: {
                    Image(systemName: "arrowshape.right")
                })
            }
        }
        .padding()
        .background(Color.gray)
        //.activityBackgroundTint(Style.orange)
        .widgetURL(
            URL(string: "sgconf://sessions/\(state.sessionID.uuidString)")
        )
    }
    
    @ViewBuilder
    var watchView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(state.sessionTitle)")
                    .font(.caption2)
                    .bold()
                Text("\(state.speakerName)")
                    .font(.caption2)
                Text("\(state.sessionStartTime, style: .time) - \(state.sessionEndTime, style: .time)")
                    .font(.caption2)
            }
            
            Spacer()
            
            Button(intent: ToggleFavoriteSessionIntent(sessionID: state.sessionID.uuidString), label: {
                Image(systemName: state.isFavorite ? "star.fill" : "star")
                    .foregroundColor(state.isFavorite ? .yellow : .gray)
            })
        }
        .padding(5)
        .background(Color.gray)
        .widgetURL(
            URL(string: "sgconf://sessions/\(state.sessionID.uuidString)")
        )
    }
    
    @ViewBuilder
    var compactLeading: some View {
        if let asset = state.speakerName.split(separator: " ").first {
            Image(asset.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 26, height: 26)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    var compactTrailing: some View {
        Text(state.sessionStartTime, style: .relative)
            .foregroundStyle(.white)
    }
    
    @ViewBuilder
    var minimal: some View {
        if let asset = state.speakerName.split(separator: " ").first {
            Image(asset.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 26, height: 26)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    var dynamicLeading: some View {
        VStack {
            Text("Starts")
            Text("\(state.sessionStartTime, style: .time)")
                .font(.caption)
                .foregroundColor(.secondary)
                .bold()
                        
            Button(intent: GetNextSessionIntent(entity: getEntity(), direction: Direction.before), label: {
                Image(systemName: "arrowshape.left")
            })
        }
        .padding(.leading, 3)
    }
    
    @ViewBuilder
    var dynamicTrailing: some View {
        VStack {
            Text("Ends")
            Text("\(state.sessionEndTime, style: .time)")
                .font(.caption)
                .foregroundColor(.secondary)
                .bold()
                        
            Button(intent: GetNextSessionIntent(entity: getEntity(), direction: Direction.after), label: {
                Image(systemName: "arrowshape.right")
            })
        }
        .padding(.trailing, 3)
    }
    
    @ViewBuilder
    var dynamicCenter: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center) {
                if let image = ImageHelper.loadImage(fileName: state.speakerImageFileName) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                }
                                
                Button(intent: ToggleFavoriteSessionIntent(sessionID: state.sessionID.uuidString), label: {
                    Image(systemName: state.isFavorite ? "star.fill" : "star")
                        .foregroundColor(state.isFavorite ? .yellow : .gray)
                })
            }
            
            Spacer()
            
            Text(state.sessionStartTime, style: .date)
                .font(.caption)
        }
    }
    
    @ViewBuilder
    var dynamicBottom: some View {
        VStack {
            Text(state.sessionTitle)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}

extension LiveActivitySessionView {
    func getSession() -> ConfSession {
        ConfSession(id: state.sessionID,
                    title: "Swift Test",
                    startTime: Date(),
                    endTime: Date(),
                    desc: "",
                    speaker: .carola)
    }
    
    func getEntity() -> SessionEntity {
        SessionEntity(session: getSession())
    }
}
