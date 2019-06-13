//
//  gestures.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/10/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class GesturesView: UIView {
    
    var tapNow: Date?
    var canPresentDebugScreen = false
    var delegate: GestureDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.backgroundColor = .cyan
        
        let doubleTapRecongizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        doubleTapRecongizer.numberOfTouchesRequired = 1
        doubleTapRecongizer.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTapRecongizer)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = .down
        downSwipe.numberOfTouchesRequired = 1
        self.addGestureRecognizer(downSwipe)
    }

    
    // Not sure what this is but it is required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didDoubleTap() {
        print("double tap")
        tapNow = Date()
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        print("swiping")
        if tapNow!.timeIntervalSinceNow > -0.2 {
            // Tell delegate that we're ready to go
            print("valid swipe")
            self.delegate!.gesturesCompleted()
        }
    }
}
