//
//  MSProgressVC.swift
//  MSProgressAnimation
//
//  Created by mr.scorpion on 4/22/16.
//  Copyright © 2016 mr.scorpion. All rights reserved.
//

import UIKit

class MSProgressVC: UIViewController {
    
    // MARK: - Properties

    @IBOutlet var progressView: ProgressView!
    @IBOutlet var progressPercentageLabel: UILabel!
    @IBOutlet var incrementProgressButton: UIButton!
    
    let gallon = Gallon()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configureProgressView()
    }
    
    // MARK: - IBActions

    @IBAction func incrementProgress(sender: UIButton) {
        
        guard progressView.curValue < CGFloat(gallon.totalOunces) else {
            return
        }
        
        // Increment progressView curValue.
        let eightOunceCup = 8
        progressView.curValue = progressView.curValue + CGFloat(eightOunceCup)
        
        // Update label based on progressView curValue.
        let percentage = (Double(progressView.curValue) / Double(gallon.totalOunces))
        progressPercentageLabel.text = numberAsPercentage(percentage)
    }
    
    // MARK: - Convenience
    
    func configureProgressView() {
        progressView.curValue = CGFloat(gallon.ouncesDrank)
        progressView.range = CGFloat(gallon.totalOunces)
    }
    
    func numberAsPercentage(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .PercentStyle
        formatter.percentSymbol = ""
        return formatter.stringFromNumber(number)!
    }
    
    // MARK: - Status Bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

