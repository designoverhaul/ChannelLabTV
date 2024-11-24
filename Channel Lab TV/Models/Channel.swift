import Foundation

struct Channel: Identifiable, Codable {
    let id: String
    let name: String
    let bannerUrl: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "channelId"
        case name = "channelTitle"
        case bannerUrl = "channelBanner"
        case description = "channelDescription"
    }
} 
