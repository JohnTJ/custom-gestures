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
        let tapView: GesturesView = GesturesView(frame: .zero)
        view.addSubview(tapView)
        
        let topConstraint = tapView.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = tapView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bottomConstraint = tapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let trailingConstraint = tapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        bottomConstraint.isActive = true
        trailingConstraint.isActive = true
        
        tapView.delegate = self
    }
}

extension ViewController: GestureDelegate {
    func gesturesCompleted() {
        coordinator?.presentDebugViewController()
    }
}
