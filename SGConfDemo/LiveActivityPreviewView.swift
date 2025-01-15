//
//  LiveActivityPreviewView.swift
//  UALWidgets
//
//  Created by Vince Davis on 9/24/24.
//

import SwiftUI
import UALWidgets

struct LiveActivityPreviewView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var currentContext: TestContext

    init() {
        currentContext = TestContext.all.first!
    }

    var body: some View {
        ScrollView {
//            Group {
//                Text("Light").bold().font(.title)
//                ForEach(LiveActivityWidget.lightCases, id: \.self) {
//                    laView($0, context: context)
//                }
//            }
//            .background(.black)
//            .environment(\.colorScheme, .light)

            Group {
                Picker("Context", selection: $currentContext) {
                    ForEach(TestContext.all) { context in
                        Text(context.name).tag(context)
                    }
                }
                Text("Dark").bold().font(.title)

                ForEach(LiveActivityWidget.allCases, id: \.self) {
                    laView($0, context: currentContext.value)
                }
            }
            .background(.white)
            .environment(\.colorScheme, .dark)
        }
    }

    @ViewBuilder
    func laView(_ la: LiveActivityWidget, context: FlightContext) -> some View {
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
                        FlightContextualLiveActivityViewV2(context: context).compactLeading

                        Spacer()

                        FlightContextualLiveActivityViewV2(context: context).compactTrailing
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

                    FlightContextualLiveActivityViewV2(context: context).minimal
                }
                .frame(width: 250, height: la.size.height)
            case .ipadLarge, .ipadSmall, .iphoneLarge, .iphoneSmall:
                FlightContextualLiveActivityViewV2(context: context)
                    .iOSView
                    .frame(width: la.size.width, height: la.size.height)
                    .cornerRadius(10)
            case .watch40mm, .watch41mm, .watch44mm, .watch45mm, .watch49mm:
                FlightContextualLiveActivityViewV2(context: context)
                    .watchView
                    .frame(width: la.size.width, height: la.size.height)
                    .cornerRadius(10)
            }
        }
    }
}