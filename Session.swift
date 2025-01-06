//
//  Session.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class Session: ObservableObject, Codable {
    @Published var climbs: [Climb]
    var length = 0.0
    
    
    init(){
        self.climbs = []
    }

    func totalAttempts() -> Int{
        var count = 0
        for c in self.climbs{
            count += c.attempts
        }
        return count
    }
    
    enum CodingKeys: String, CodingKey {
        case climbs, length
    }
    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.climbs = try container.decode([Climb].self, forKey: .climbs)
            self.length = try container.decode(Double.self, forKey: .length)
        }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(climbs, forKey: .climbs)
        try container.encode(length, forKey: .length)
    }

    
    
    
    
}
