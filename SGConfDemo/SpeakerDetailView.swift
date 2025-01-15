import SwiftUI

struct SpeakerDetailView: View {
    let speaker: Speaker

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(speaker.name)
                .font(.largeTitle)
                .bold()
            if let url = URL(string: speaker.photoURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            Text("Biography")
                .font(.headline)
            Text(speaker.bio)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle(speaker.name)
    }
}