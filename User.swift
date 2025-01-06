//
//  User.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

//Signleton
class User : ObservableObject{

    @Published var climbs : [Climb]
    //@Published var sessionCount: Int = 0
    @Published var sessions : [Session]
    @Published var hardestGrade = Grade(gradeStr: "V0")
    @Published var name: String
    
    //static let USER = User()
    
    init(hardestGrade : Grade, name : String){
        self.climbs = []
        self.hardestGrade = hardestGrade
        self.name = name
        self.sessions = []
    }
    
    func totalAttempts() -> Int{
        var count = 0
        for c in climbs{
            count += c.attempts
        }
        return count
    }
    
//    static func getUser() -> User{
//        return self.USER
//    }
//
    
    
}
