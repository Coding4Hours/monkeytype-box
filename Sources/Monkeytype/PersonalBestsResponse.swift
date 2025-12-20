//
//  Created by Artem Novichkov on 20.11.2024.
//


public struct PersonalBestsResponse: Decodable {
    let data: [String: [PersonalBest]]
}

struct PersonalBest: Decodable {
    let acc: Double
    let wpm: Double
}

extension PersonalBest {
    static let mock: PersonalBest = .init(acc: 99.9, wpm: 51.99)
}
