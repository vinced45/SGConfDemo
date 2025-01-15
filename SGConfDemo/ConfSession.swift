import Foundation
import SwiftData

@Model
struct ConfSession {
    @Attribute(.unique) var id: UUID
    var title: String
    var startTime: Date
    var endTime: Date
    var desc: String
}
