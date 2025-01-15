import ActivityKit

struct SessionActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var sessionTitle: String
        var sessionStartTime: Date
        var sessionEndTime: Date
    }

    var sessionName: String
}