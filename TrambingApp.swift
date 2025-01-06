//
//  TrambingApp.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-25.
//

import SwiftUI

@main
struct TrambingApp: App {
    @StateObject var user : User = User(hardestGrade: Grade(gradeStr: "V0"), name: "Yannick")
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
    }
}
