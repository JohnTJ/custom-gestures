//
//  Coordinator.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/12/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
