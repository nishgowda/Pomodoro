//
//  ContentView.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/20/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
        VStack{
            HStack{
            StopWatch()
                .frame(maxWidth: .infinity, maxHeight:  .infinity)
       
            }
            }.background(Color.black)
              

                }
       
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
