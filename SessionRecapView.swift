//
//  SessionRecapView.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2025-01-01.
//

import SwiftUI
struct SessionRecapView: View{
    @StateObject var manager: SessionManager
    
    init(manager: SessionManager){
        _manager = StateObject(wrappedValue: manager)
        manager.endSession()
        
    }
    
    var body: some View{
        
        NavigationStack{
            //VStack {
                // Stopwatch at the top
                StopwatchView(timeEslapsed: manager.curSesh.length, isRunning: true)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .padding(.bottom, 20)
                
                Spacer()
            //}
            List {
                ForEach(manager.curSesh.climbs.reversed(), id: \.self) { climb in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(climb.name)
                                .font(.headline)
                            
                            Text(climb.grade.gradeStr)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(Color.blue)
                            
                            
                        }
                    }
                    
                }
            }
        }
        
    }
    
}
//    struct ClimbRecap: View {
//        var title: String
//        var grade: Grade
//        var attempts: Int
//
//        var body: some View {
//            VStack {
//                Text(title)
//                    .font(.title)
//                    .fontWeight(.bold)
//                Text(grade.gradeStr)
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.blue)
//                Text(String(attempts))
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//            }
//            .frame(maxWidth: .infinity) // Adjust size as needed
//            .background(Color.blue.opacity(0.2))
//            .cornerRadius(10)
//        }
//    }


            
//struct SessionRecapView_Previews: PreviewProvider {
//   // @EnvironmentObject var manager: SessionManager
//    static var previews: some View {
//
//        SessionRecapView(manager: SessionManager(user: User(hardestGrade: Grade(gradeStr: "V11"), name: "Yannick")))
//    }
//}
//
