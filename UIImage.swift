//
//  UIImage.swift
//  Pomodoro
//
//  Created by Nish Gowda on 3/21/20.
//  Copyright © 2020 Nish Gowda. All rights reserved.
//

import Cocoa

// Step 1: Typealias UIImage to NSImage
typealias UIImage = NSImage

// Step 2: You might want to add these APIs that UIImage has but NSImage doesn't.
extension NSImage {
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)

        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }

    var (named name: String) {
        self.init(named: Name(name))
    
}

// Step 3: Profit - you can now make your model code that uses UIImage cross-platform!
struct User {
    let name: String
    let profileImage: UIImage
}
