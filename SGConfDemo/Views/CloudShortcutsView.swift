//
//  CloudShortcutsView.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/16/25.
//

import SwiftUI

struct ShortcutItem: Identifiable {
    let id = UUID()
    let name: String
    let url: String
    let details: String
}

struct CloudShortcutsView: View {
    let items: [ShortcutItem] = [
            ShortcutItem(name: "Get All Sessions With Speakers", url: "https://www.icloud.com/shortcuts/5ace644dece7410fac3efef2ea34fe74", details: "It gets all the speakers and their sessions and puts them in a text file."),
            ShortcutItem(name: "Save Speaker Images to Photos", url: "https://www.icloud.com/shortcuts/632a47a8ecf747168659f0a9aace9987", details: "It gets all speaker images, downloads them and saves them to your Photos library."),
            ShortcutItem(name: "ChatGPT Best Session", url: "https://www.icloud.com/shortcuts/7b56a811e96444b4bc0248060fb636c1", details: "It gets all the session info and asks ChatGPT to pick the best one. *** You need the ChatGPT app installed to run this one. ***")
        ]
        
        var body: some View {
            List(items) { item in
                VStack(alignment: .leading) {
                    Link(item.name, destination: URL(string: item.url)!)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(item.details)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("iCloud Shortcuts")
        }
}

#Preview {
    CloudShortcutsView()
}

