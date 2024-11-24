import SwiftUI

struct ChannelGridView: View {
    @StateObject private var viewModel = ChannelViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.channels) { channel in
                    NavigationLink(destination: ChannelDetailView(channel: channel)) {
                        ChannelCardView(channel: channel)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchChannels()
        }
    }
}

#Preview {
    ChannelGridView()
} 