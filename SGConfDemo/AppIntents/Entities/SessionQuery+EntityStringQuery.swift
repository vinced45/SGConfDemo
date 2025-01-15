//
//  SessionQuery+EntityStringQuery.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//

import AppIntents
import SwiftUI

extension SessionQuery: EntityStringQuery {
    func entities(matching string: String) async throws -> [SessionEntity] {
        return await ConfSessionManager().fetchSessions()
            .filter({ $0.title.localizedCaseInsensitiveContains(string) })
            .map({ SessionEntity(session: $0)})
    }
}
