//
//  ViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var validSwipe = true
    var timer = Timer()
    var timePassed = 0.0 {
        didSet {
            if (timePassed > 0.2) {
                print("timer resetting")
                timePassed = 0
                timer.invalidate()
                validSwipe = false
            } else {
                validSwipe = true
            }
        }
    }
    
    @IBOutlet var tapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doubleTapRecongizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        doubleTapRecongizer.numberOfTouchesRequired = 2
        doubleTapRecongizer.numberOfTapsRequired = 2
        tapView.addGestureRecognizer(doubleTapRecongizer)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizer.Direction.down
        downSwipe.numberOfTouchesRequired = 2
        tapView.addGestureRecognizer(downSwipe)

    }
    
    @objc func addTimePassed() {
        timePassed += 0.1
        print("Time passed: \(timePassed)")
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(addTimePassed), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func didDoubleTap() {
        print("double tap")
        runTimer()
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        if (validSwipe) {
            presentDebugViewController()
        } else {
            print("invalid swipe")
        }
    }
    
    /// Presents Debug View Controller
    func presentDebugViewController() {
        let debugViewController:UIViewController = storyboard?.instantiateViewController(withIdentifier: "DebugViewController") as! DebugViewController
        self.present(debugViewController, animated: true)
    }
}
