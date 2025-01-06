//
//  HomeView.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-26.
//

import SwiftUI

struct HomeView: View {
    //@EnvironmentObject var user: User
    
    
    var body: some View {
        var user = User(hardestGrade: Grade(gradeStr: "v6"), name: "Yannick")
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                // Welcome Message
                Text("Welcome back, \(user.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Analytics Grid
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        AnalyticsSquare(title: "Total Sessions", value: String(user.sessions.count))
                        AnalyticsSquare(title: "Hardest Grade", value: user.hardestGrade.gradeStr)
                    }
                    HStack(spacing: 20) {
                        AnalyticsSquare(title: "Total Climbs", value: String(user.climbs.count))
                        AnalyticsSquare(title: "Projects Sent", value: "8")
                    }
                }
                
                .padding()
                
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination: SessionView(user: user).environmentObject(SessionManager(user: user))){
                        Text("Start climbing")
                        
                            .padding()
                            .font(.system(size: 36, weight: .bold))
                            .frame(width: 300, height: 75)
                            .background(Color.yellow)
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                
                
                
                .padding()
                
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct AnalyticsSquare: View {
    var title: String
    var value: String

    var body: some View {
        VStack {
            Text(value)
                .font(.title)
                .fontWeight(.bold)
            Text(title)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .frame(width: 150, height: 100) // Adjust size as needed
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

        HomeView()
            .environmentObject(User(hardestGrade: Grade(gradeStr: "V11"), name: "Yannick"))
    }
}
