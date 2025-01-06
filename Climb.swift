//
//  Climb.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class Climb : Hashable, Identifiable {
    
    let id = UUID()
    let grade : Grade
    var attempts : Int
    var flashed : Bool
    var tops : Int
    var name: String
    
    init(name: String, grade: Grade) {
        self.name = name
        self.grade = grade
        self.attempts = 0
        self.flashed = false
        self.tops = 0
    }
    
    func attempted(topped: Bool){
        if (topped){
            if (self.attempts == 0){
                self.flashed = true;
            }
            self.tops += 1
        }
        self.attempts += 1
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(grade.gradeStr)
    }
    
    
    static func == (lhs: Climb, rhs: Climb) -> Bool {
        return lhs.id == rhs.id
    }
    
  
    
}
