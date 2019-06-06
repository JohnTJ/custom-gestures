//
//  ViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startingPlace: UIView!
    @IBOutlet var endingPlace: UIView!
    
    var myGesture: MyCustomGesture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startingPlace.backgroundColor = UIColor.clear
        endingPlace.backgroundColor = UIColor.clear
        
        myGesture = MyCustomGesture(target: self, action: #selector(gestureAction))
        view.addGestureRecognizer(myGesture)
    }
    
    
    /// Gesture Action that detects if the gesture starts and ends in the two frames
    @objc func gestureAction() {
        let startEndAngle = atan2(endingPlace.center.y - startingPlace.center.y, endingPlace.center.x - startingPlace.center.x)
        let tolerance: CGFloat = 0.2
        
        if (myGesture.state == UIGestureRecognizer.State.ended) {
            let angleDifference = abs(myGesture.angle - startEndAngle)
            let yLimit = startingPlace.center.y + (startingPlace.frame.size.height / 2)
            let minStartX = startingPlace.center.x - (startingPlace.frame.size.width / 2)
            let maxStartX = startingPlace.center.x + (startingPlace.frame.size.width / 2)
            let minEndX = endingPlace.center.x - (startingPlace.frame.size.width / 2)
            let maxEndX = endingPlace.center.x + (startingPlace.frame.size.width / 2)

            if (angleDifference < tolerance && myGesture.startingPoint.y <= yLimit && myGesture.startingPoint.x < maxStartX && myGesture.endingPoint.x > minEndX && myGesture.startingPoint.x > minStartX && myGesture.endingPoint.x < maxEndX) {
                print("Yes")
                presentDebugViewController()
            } else {
                print("No")
            }
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
