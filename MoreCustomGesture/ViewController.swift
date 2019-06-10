//
//  ViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapNow: Date?
    
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
    
    @objc func didDoubleTap() {
        print("double tap")
        tapNow = Date()
        print(tapNow!)
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        if tapNow != nil && tapNow!.timeIntervalSinceNow > -0.2 {
            presentDebugViewController()
        }
    }
    
    /// Presents Debug View Controller
    func presentDebugViewController() {
        let debugViewController:UIViewController = storyboard?.instantiateViewController(withIdentifier: "DebugViewController") as! DebugViewController
        self.present(debugViewController, animated: true)
    }
}
