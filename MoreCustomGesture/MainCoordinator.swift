//
//  MainCoordinator.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/12/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }
    
    func presentDebugViewController() {
        let vc = DebugViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
