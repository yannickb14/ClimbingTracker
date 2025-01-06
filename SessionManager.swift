//
//  SessionManager.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class SessionManager: ObservableObject{
    @Published var curSesh : Session
    var startTime : Date
    @Published  var user : User
    
    init(user:User){
        self.startTime = Date()
        self.curSesh = Session()
        self.user = user

    }
    
    func endSession(){
        //Calculate time
        curSesh.length = Date().timeIntervalSince(startTime)
        
        //Add the session to the users sessions
        user.sessions.append(self.curSesh)
        
        //**TODO Calculate analytics**
    }
    
    func addClimb(c : Climb){
        user.climbs.append(c)
        
        if !(user.climbs.contains(c)){
            self.curSesh.climbs.append(c)
        }
    }
    


}
