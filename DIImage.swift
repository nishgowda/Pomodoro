//
//  DIImage.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/21/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//


import SwiftUI


     public struct DIImage: View {
         var isLight: Bool = true
         var imageName: String
         
         @Environment(\.colorScheme) var colorScheme
         
         public init(_ imageName: String){
          self.imageName = imageName
         }
         
         public init(_ imageName: String, isLight: Bool){
          self.imageName = imageName
          self.isLight = isLight
         }
        func nsImage( light: Bool)->NSImage?{
          let image = NSImage(named: imageName)
          if isLight == light{
           return image!
          }
          
          return image?.invert() ?? nil
         }
         
            public var body: some View {
          Image(nsImage: nsImage(light: colorScheme == ColorScheme.light)!).resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width:300, height:300)
            }
        }
    
extension NSImage {
  func invert() ->NSImage?{
    let context = CIContext(options: nil)
    let inputImage = CIImage(image: self)
    guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        let outputImgage = filter.outputImage!
    let out = convert(input: outputImgage, withExtent: (inputImage?.extent)!,
              context: context)
        
        return out
  }
  
  func convert( input: CIImage, withExtent: CGRect, context: CIContext)->NSImage{
      let cgOutputImage = context.createCGImage(input, from: withExtent)
      return NSImage( cgImage: cgOutputImage!)
  }
}

