import SwiftUI

struct ChannelDetailView: View {
    let channel: Channel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Banner Image
            AsyncImage(url: URL(string: channel.bannerUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
            }
            .frame(height: 300)
            .clipped()
            
            // Channel Name
            Text(channel.name)
                .font(.title)
                .padding(.horizontal)
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .onExitCommand {
            dismiss()
        }
    }
} 