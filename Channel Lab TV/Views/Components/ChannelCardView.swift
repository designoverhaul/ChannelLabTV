import SwiftUI

struct ChannelCardView: View {
    let channel: Channel
    @Environment(\.isFocused) private var isFocused
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: channel.bannerUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.clear)
            }
            .frame(height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(channel.name)
                .font(.callout)
                .lineLimit(1)
                .padding(.vertical, 4)
                .padding(.horizontal, 4)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isFocused ? Color.blue : Color.clear, lineWidth: 4)
        )
        .scaleEffect(isFocused ? 1.02 : 1.0)
        .animation(.easeInOut, value: isFocused)
    }
} 
