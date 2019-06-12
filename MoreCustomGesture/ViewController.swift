//
//  ViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        let tapView: GesturesView = GesturesView(frame: frame)
        tapView.delegate = self
    }
}

extension ViewController: GestureDelegate {
    func gesturesCompleted() {
        coordinator?.presentDebugViewController()
    }
}
