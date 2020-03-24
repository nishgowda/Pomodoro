//
//  StopWatch.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/21/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//

import SwiftUI

struct StopWatch: View {
    @ObservedObject var timerManager = TimerManager()
    @State var selectedPickerIndex = 0
    let availableLaps = Array(1...4)
    @State var count = 1
    var body: some View {
        
        VStack{
            Text(count == 0 ? "WORK":"BREAK").offset(x: 0, y: 80).font(Font.custom("Futura", size: 33))
            Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft)).font(.system(size: 100)).padding(.top, 80).font(Font.custom("theboldfont",size:33))
            Image(timerManager.timerMode == .running ? "pause" : "play")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .onTapGesture (perform :{
                        self.timerManager.timerMode == .running ?
                            self.timerManager.pause() : self.startTime()
                                 })
     
            }  
        
        }
    func startTime(){
        if count == 0{
            self.timerManager.studyStart()
            count+=1
        }
        else{
            self.timerManager.breakStart()
            count*=0
        }
        }

    }
    



struct StopWatch_Previews: PreviewProvider {
    static var previews: some View {
        StopWatch()
    }
}
