//
//  LiveActivityPreviewView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/12/25.
//

import SwiftUI
import WidgetKit

struct LiveActivityPreviewView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var currentSession: TestSession

    init() {
        currentSession = TestSession.all.first!
    }

    var body: some View {
        ScrollView {
            VStack {
                Picker("Context", selection: $currentSession) {
                    ForEach(TestSession.all) { session in
                        Text(session.state.sessionTitle).tag(session as TestSession)
                    }
                }

                ForEach(LiveActivityWidget.allCases, id: \.self) {
                    laView($0, session: currentSession)
                }
            }
        }
    }

    @ViewBuilder
    func laView(_ la: LiveActivityWidget, session: TestSession) -> some View {
        VStack(spacing: 3) {
            Text(la.title)
                .font(.caption)
                .bold()
                .foregroundStyle(.black)

            switch la {
            case .dynamicIslandCompactLarge, .dynamicIslandCompactSmall:
                ZStack {
                    Capsule()
                        .frame(width: 250, height: la.size.height)
                        .foregroundStyle(.black)

                    HStack {
                        LiveActivitySessionView(
                            session: session.attribute,
                            state: session.state
                        )
                        .compactLeading

                        Spacer()

                        LiveActivitySessionView(
                            session: session.attribute,
                            state: session.state
                        ).compactTrailing
                    }
                    .padding(.horizontal, 5)
                    //.frame(width: 250, height: la.size.height)
                }
                .frame(width: 250, height: la.size.height)

            case .dynamicIslandMinimalLarge, .dynamicIslandMinimalSmall:
                ZStack {
                    Circle()
                        .frame(width: 36, height: la.size.height)
                        .foregroundStyle(.black)

                    LiveActivitySessionView(
                        session: session.attribute,
                        state: session.state
                    )
                    .minimal
                }
                .frame(width: 250, height: la.size.height)
            case .ipadLarge, .ipadSmall, .iphoneLarge, .iphoneSmall:
                LiveActivitySessionView(
                    session: session.attribute,
                    state: session.state
                )
                .phoneView
                .frame(width: la.size.width, height: la.size.height)
                .background(Color.gray.opacity(0.4))
                .cornerRadius(20)
            case .watch40mm, .watch41mm, .watch44mm, .watch45mm, .watch49mm:
                LiveActivitySessionView(
                    session: session.attribute,
                    state: session.state
                )
                .watchView
                .frame(width: la.size.width, height: la.size.height)
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            }
        }
    }
}
