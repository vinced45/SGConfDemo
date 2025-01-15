import SwiftUI
import ActivityKit

struct ConfSessionDetailView: View {
    let session: ConfSession
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text(session.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 8)

                HStack(alignment: .center, spacing: 8) {
                    AsyncImage(url: URL(string: session.speaker?.photoURL ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 80, height: 80)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(session.speaker?.name ?? "")
                            .font(.headline)
                        Text(session.speaker?.bio ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                    Text(session.desc)
                        .font(.body)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Time")
                        .font(.headline)
                    Text("\(session.startTime.formatted(date: .long, time: .shortened)) - \(session.endTime.formatted(date: .long, time: .shortened))")
                        .font(.body)
                }

                // Start Live Activity Button
                Button(action: startLiveActivity) {
                    Text("Start Live Activity")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LiveActivityManager.isLiveActivityActive() ? Color.gray : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(LiveActivityManager.isLiveActivityActive())

                // Update Live Activity Button
                Button(action: updateLiveActivity) {
                    Text("Update Live Activity")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LiveActivityManager.isLiveActivityActive() ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!LiveActivityManager.isLiveActivityActive())

                // End Live Activity Button
                Button(action: endLiveActivity) {
                    Text("End Live Activity")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LiveActivityManager.isLiveActivityActive() ? Color.red : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!LiveActivityManager.isLiveActivityActive())
            }
            .padding()
        }
        .navigationTitle("Session Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: toggleFavorite) {
                    Image(systemName: session.isFavorite ? "star.fill" : "star")
                        .foregroundColor(session.isFavorite ? .yellow : .gray)
                }
            }
        }
    }
    
    // Toggle favorite status and save changes
    private func toggleFavorite() {
        session.isFavorite.toggle()
        try? modelContext.save() // Persist the change
    }

    private func startLiveActivity() {
        LiveActivityManager.startLiveActivity(
            id: session.id,
            sessionName: session.title,
            startTime: session.startTime,
            endTime: session.endTime,
            speaker: session.speaker?.name ?? "",
            imageUrl: session.speaker?.photoURL ?? "",
            isFavorite: session.isFavorite
        )
    }

    private func updateLiveActivity() {
        LiveActivityManager.updateLiveActivity(
            id: session.id,
            sessionName: session.title,
            startTime: session.startTime,
            endTime: session.endTime,
            speaker: session.speaker?.name ?? "",
            imageUrl: session.speaker?.photoURL ?? "",
            isFavorite: session.isFavorite
        )
    }

    private func endLiveActivity() {
        LiveActivityManager.endLiveActivity()
    }
}
