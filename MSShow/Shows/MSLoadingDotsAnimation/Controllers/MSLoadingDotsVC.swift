//
//  MSLoadingDotsVC.swift
//  MSLoadingDotsAnimation
//
//  Created by mr.scorpion on 4/19/16.
//  Copyright © 2016 mr.scorpion. All rights reserved.
//

import UIKit

class MSLoadingDotsVC: UIViewController {
    
    // MARK: - Properties
    var loadingView: LoadingDots?
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Set initial loading view.
        loadingView = LoadingDots(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)))
        self.view.addSubview(loadingView!)
        loadingView!.startAnimation()
        
        // Tap Dismiss
        let singleFingerTwo = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        singleFingerTwo.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(singleFingerTwo)
    }

    // MARK: - Convenience
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
