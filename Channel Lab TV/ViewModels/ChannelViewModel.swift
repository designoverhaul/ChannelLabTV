import SwiftUI

@MainActor
class ChannelViewModel: ObservableObject {
    @Published var channels: [Channel] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let firebaseService = FirebaseService()
    
    func fetchChannels() {
        isLoading = true
        print("ChannelViewModel: Starting channel fetch")
        
        Task {
            do {
                channels = try await firebaseService.fetchChannels()
                print("ChannelViewModel: Successfully fetched \(channels.count) channels")
            } catch {
                self.error = error
                print("ChannelViewModel: Error fetching channels: \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
} 