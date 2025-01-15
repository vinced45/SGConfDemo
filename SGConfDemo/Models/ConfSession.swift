import Foundation
import SwiftData

@Model
class ConfSession {
    @Attribute(.unique) var id: UUID
    var title: String
    var startTime: Date
    var endTime: Date
    var desc: String
    var speaker: Speaker?
    var isFavorite: Bool = false

    init(id: UUID, title: String, startTime: Date, endTime: Date, desc: String, speaker: Speaker?) {
        self.id = id
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.desc = desc
        self.speaker = speaker
    }
}