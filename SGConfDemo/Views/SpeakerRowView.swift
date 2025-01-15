struct SpeakerRowView: View {
    var speaker: Speaker
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: speaker.photoURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(speaker.name)
                    .font(.headline)
                Text(speaker.bio)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SpeakerRowView(speaker: .vince)
}