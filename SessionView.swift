//
//  SessionView.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-27.
//

import SwiftUI

///THINGS TO ADD
///Confirmation screen to to remove a climb
///option to tap on a climb to edit it


struct SessionView: View {
    @EnvironmentObject var user: User
    @StateObject var manager: SessionManager
    
    @State private var grade: String = "" // State for the text field input
    @State private var name: String = ""
    
    @State private var refreshID = UUID()
    
    init(user: User) {
        _manager = StateObject(wrappedValue: SessionManager(user: user))
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                // Stopwatch at the top
                StopwatchView(timeEslapsed: 0)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom, 20)
                
                Spacer()
                
                // Grade input and button
                VStack(spacing: 20) {
                    HStack {
                        VStack{
                            TextField("Name", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: 400)
                            TextField("Grade", text: $grade)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: 400)
                            
                            
                            Button(action: {
                                addGrade()
                            }) {
                                Text("Add climb")
                                    .padding()
                                    .font(.system(size: 22))
                                    .background(Color.yellow)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                NavigationStack {
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
                                
                                Spacer()
                                
                                Button(action: {
                                    topped(climb: climb)
                                }) {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.green)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Button(action: {
                                    attempted(climb: climb)
                                }) {
                                    Image(systemName: "figure.run")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Button(action: {
                                    remove(climb: climb)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .id(refreshID)
                }
                
                
                Spacer()
                
//                HStack{
//                    Spacer()
//                    NavigationLink(destination: SessionRecapView(manager: manager).environmentObject(SessionManager(user: user))){
//                        Text("Start climbing")
//                        
//                            .padding()
//                            .font(.system(size: 36, weight: .bold))
//                            .frame(width: 300, height: 75)
//                            .background(Color.yellow)
//                            .foregroundColor(Color.black)
//                            .cornerRadius(10)
//                    }
//                    
//                    Spacer()
//                }
                
                
                NavigationLink(destination: SessionRecapView(manager: manager).environmentObject(manager)){
                    Text("End session")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)

                }
                
                
//                Button(action: endSession) {
//                    Text("End Session")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.red)
//                        .foregroundColor(.black)
//                        .cornerRadius(10)
//                }
                
                
                .padding(.horizontal)
                .padding(.bottom)
            }
            .padding()
            
        }
    }
    
    // Placeholder function for handling "Add Grade" button press
    func addGrade() {
        manager.curSesh.climbs.append(Climb(name: name, grade: Grade(gradeStr: grade)))
        
        name = ""
        grade = "" // Clear the input field
    }
    
    func endSession(){
        manager.endSession()
        //Go to recap view
    }
    
    func topped(climb: Climb){
        climb.attempted(topped: true)
    }
    
    func attempted(climb: Climb){
        climb.attempted(topped: false)
    }
    
    func remove(climb: Climb){
    
        withAnimation(.spring(response: 0.6, dampingFraction: 0.2, blendDuration: 0.3)) {
            if let index = manager.curSesh.climbs.firstIndex(of: climb) {
                manager.curSesh.climbs.remove(at: index)
                refreshID = UUID()
            
            }
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    @EnvironmentObject var user: User
    static var previews: some View {
        
        SessionView(user: User(hardestGrade: Grade(gradeStr: "v0"), name: "Yan"))
        
    }
}
