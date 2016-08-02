//
//  SwiftExtenstions.swift
//  MSFadingText
//
//  Created by mr.scorpion on 4/27/16.
//  Copyright © 2016 mr.scorpion. All rights reserved.
//

import UIKit

extension CATextLayer {
    convenience init(frame: CGRect, string: NSAttributedString) {
        self.init()
        self.contentsScale = UIScreen.mainScreen().scale
        self.frame = frame
        self.string = string
    }
}