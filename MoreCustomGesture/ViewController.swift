//
//  ViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myGesture: MyCustomGesture!
    
    var doubleTapDone = false
    var swipeDownDone = false
    var secretGestureDone = false
    
    @IBOutlet var tapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doubleTapRecognizer: UITapGestureRecognizer = {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
            tapRecognizer.numberOfTapsRequired = 2
            tapRecognizer.numberOfTouchesRequired = 2
            return tapRecognizer
        }()
        
        tapView.addGestureRecognizer(doubleTapRecognizer)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizer.Direction.down
        downSwipe.numberOfTouchesRequired = 2
        tapView.addGestureRecognizer(downSwipe)
        
    }
    
    @objc func didDoubleTap() {
        doubleTapDone = true
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction {
        case .down:
            print("Swipe Down!")
            secretGestureDone = true
        default:
            break
        }
        
    }
    
    /// Presents Debug View Controller
    func presentDebugViewController() {
        let debugViewController:UIViewController = storyboard?.instantiateViewController(withIdentifier: "DebugViewController") as! DebugViewController
        self.present(debugViewController, animated: true)
    }
}


/// Custom Gesture class that holds angle, starting point, and ending point
class MyCustomGesture: UIGestureRecognizer {
    
    var angle: CGFloat = 0.0
    var startingPoint: CGPoint!
    var endingPoint: CGPoint!

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        state = UIGestureRecognizer.State.began
        startingPoint = touches.first?.location(in: view)
        angle = 0.0
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        state = UIGestureRecognizer.State.ended
        endingPoint = touches.first?.location(in: view)
        angle = atan2(endingPoint.y - startingPoint.y, endingPoint.x - startingPoint.x)
        print(angle)
    }
    
}
