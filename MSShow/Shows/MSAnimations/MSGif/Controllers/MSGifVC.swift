//
//  ViewController.swift
//  GifAnimation
//
//  Created by Larry Natalicio on 4/30/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit
import Gifu

class MSGifVC: UIViewController {
    
    // MARK: - Types
    struct Constants {
        struct Gifs {
            static let catVideo = "cat-video.gif"
        }
    }
    
    // MARK: - Properties
    var gifImageView: AnimatableImageView?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        gifImageView = AnimatableImageView(frame: CGRectMake(0, 100, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame)-200)/2))
            
        self.view.addSubview(gifImageView!)
        /*
         Use third-party library `Gifu` to display gif.
        */
        gifImageView!.animateWithImage(named: Constants.Gifs.catVideo)
    }
    
    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

