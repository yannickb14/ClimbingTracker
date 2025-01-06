//
//  Session.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class Session: ObservableObject{
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
    
    
    
    
}
