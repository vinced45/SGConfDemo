import AppIntents
import SwiftUI
import SwiftData

struct GetAllSpeakersIntent: AppIntent {
    static var title: LocalizedStringResource = "Get All Speakers"
    static var description: IntentDescription = "Get all speakers with details."
    static var openAppWhenRun: Bool = false

    func perform() async throws -> some IntentResult & ReturnsValue<[SpeakerEntity]?> {
        let speakers = await ConfSessionManager().fetchSpeakers()
            .map({ SpeakerEntity(speaker: $0)})
        return .result(value: speakers)
    }
    
    static var parameterSummary: any ParameterSummary {
        Summary("Get All Speakers")
    }
}