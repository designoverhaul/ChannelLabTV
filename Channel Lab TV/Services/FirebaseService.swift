import FirebaseFirestore

class FirebaseService {
    private let db = Firestore.firestore()
    
    func fetchChannels() async throws -> [Channel] {
        print("Attempting to fetch channels from Firebase...")
        let snapshot = try await db.collection("curatedContent").getDocuments()
        print("Successfully fetched \(snapshot.documents.count) documents")
        
        return snapshot.documents.compactMap { document in
            let data = document.data()
            return Channel(
                id: data["channelId"] as? String ?? "",
                name: data["channelTitle"] as? String ?? "",
                bannerUrl: data["channelBanner"] as? String ?? "",
                description: data["channelDescription"] as? String ?? ""
            )
        }
    }
} 
