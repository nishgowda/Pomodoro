//
//  TimerManager.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/21/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject{
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 25*60
    var timer = Timer()
    @Published var count : Int = 1

    
    func studyStart(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {Timer in
           
            if self.secondsLeft == 0{
                self.secondsLeft = 25*60
                self.timerMode = .paused
                self.timer.invalidate()
                self.studyTime()
            }
          
             self.secondsLeft -= 1
        })
        playSound(sound: "Bell", type: "mp3")
     

       
    }
    func breakStart(){
        timerMode = .running
               timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {Timer in
                   if self.secondsLeft == 0{
                       self.secondsLeft = 5*60
                    self.timerMode = .paused
                    self.timer.invalidate()
                             self.breakTime()
                        }
       
                self.secondsLeft -= 1
               })
               playSound(sound: "Bell", type: "mp3")
      

    }
    func studyTime(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true, block: {Timer in
            if self.secondsLeft == 0{
                self.secondsLeft = 25*60
              
            }
    
    })
                playSound(sound: "Bell", type: "mp3")
    }
   func breakTime(){
    timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true, block: {Timer in
            if self.secondsLeft == 0{
                self.secondsLeft = 5*60
             
            }
    
    })
            playSound(sound: "Bell", type: "mp3")
    }
    
    
    func reset(){
        self.timerMode = .initial
             self.secondsLeft = 0
        timer.invalidate()

    }

    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
    func setTimerLength(minutes: Int){
        secondsLeft = minutes
    }
}
