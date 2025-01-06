//
//  Climb.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class Climb : Codable, Hashable, Equatable {
    
    private static var CLIMBS = [Climb]().self
    
    public static func getClimb(name: String, grade: Grade) -> Climb{
        let c = Climb(name: name, grade: grade)
        for climb in CLIMBS {
            if climb == c{
                return climb
            }
        }
        return c
    }
    
   
    
    let grade : Grade
    var attempts : Int
    var flashed : Bool
    var tops : Int
    var name: String
    
    init(name: String, grade: Grade) {
        grade.gradeStr = grade.gradeStr.lowercased()
        
        self.name = name.lowercased()
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
    
    static func ==(lhs: Climb, rhs: Climb) -> Bool{
        return lhs.name == rhs.name && lhs.grade.gradeStr == rhs.grade.gradeStr
    }

    
  
    
}
