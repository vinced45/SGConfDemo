//
//  SGConfDemoWidgetBundle.swift
//  SGConfDemoWidget
//
//  Created by Vince Davis on 1/12/25.
//

import WidgetKit
import SwiftUI

@main
struct SGConfDemoWidgetBundle: WidgetBundle {
    var body: some Widget {
        SGConfDemoWidget()
        SGConfDemoWidgetControl()
        SGConfDemoWidgetLiveActivity()
    }
}
