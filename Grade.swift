//
//  Grade.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import Foundation

class Grade: CustomStringConvertible{
    
    var gradeStr : String
    
    init(gradeStr : String){
        self.gradeStr = gradeStr
    }
    
    var description: String {
        return gradeStr
    }


    
}
