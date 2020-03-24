//
//  PlaySound.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/21/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//

import Foundation
import AVFoundation

//Mark: -Audio Player

var audioPlayer : AVAudioPlayer?
func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
    do{
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    }catch{
        print("Could not find and play the sound file")
    }
    
}
}
