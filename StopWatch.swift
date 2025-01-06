//
//  StopWatch.swift
//  Trambing
//
//  Created by Yannick Bensimon on 2024-12-28.
//

import Foundation
import SwiftUI

import SwiftUI

struct StopwatchView: View {
    @State private var timeElapsed: TimeInterval
    @State private var isRunning = false
    @State private var timer: Timer?

    init(timeEslapsed: TimeInterval){
        self.timeElapsed = timeEslapsed
    }
    var body: some View {
        VStack(spacing: 20) {
            Text(formatTime(timeElapsed))
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .padding()

  
            }
        .onAppear(perform: startStopwatch)
        .onDisappear(perform: stopStopwatch)
        }
       
       
    


    func startStopwatch() {
        if isRunning {
            // Pause stopwatch
            timer?.invalidate()
        } else {
            // Start stopwatch
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                timeElapsed += 0.1
            }
        }
        isRunning.toggle()
    }
    
    func stopStopwatch() {
        timer?.invalidate()
    }

    func resetStopwatch() {
        timer?.invalidate()
        timeElapsed = 0
        isRunning = false
    }
    

    func formatTime(_ time: TimeInterval) -> String {
        let totalMinutes = Int(time) / 60
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        let seconds = Int(time) % 60
        //let milliseconds = Int((time * 100).truncatingRemainder(dividingBy: 100))
        return String(format: "%02d:%02d.%02d", hours, minutes, seconds)
    }
}

//struct ContentView: View {
//    var body: some View {
//        StopwatchView()
//    }
//}

struct StopWatch_Preview: PreviewProvider {
    static var previews: some View {

        StopwatchView(timeEslapsed: 0)
    }
}
