//
//  ImagerHelper.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//

//
//  ImagerHelper.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//

import Foundation
import UIKit

struct ImageHelper {
    static let appGroupName = "group.com.vincedavis.SGConfDemo2"

    static func downloadAndSaveImage(urlString: String, fileName: String) async throws -> Bool {
        guard let appGroupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupName) else {
            throw URLError(.badURL)
        }

        let destinationURL = appGroupURL.appendingPathComponent(fileName)

        // Check if the file already exists in the cache
        if FileManager.default.fileExists(atPath: destinationURL.path) {
            print("Image already exists in cache: \(destinationURL.path)")
            return true
        }

        // If the file doesn't exist, download and save it
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            try data.write(to: destinationURL)
            print("Image downloaded and saved: \(destinationURL.path)")
            return true
        } catch {
            print("Error downloading or saving image: \(error.localizedDescription)")
            throw error
        }
    }

    static func loadImage(fileName: String) -> UIImage? {
        guard let appGroupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupName) else {
            return nil
        }

        let imagePath = appGroupURL.appendingPathComponent(fileName).path
        return UIImage(contentsOfFile: imagePath)
    }
}
