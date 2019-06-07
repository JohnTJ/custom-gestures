//
//  DebugViewController.swift
//  MoreCustomGesture
//
//  Created by John Jones on 6/6/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {
    
    
    @IBAction func exitAction(_ sender: Any) {
        let homeViewController:UIViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
        
        self.present(homeViewController, animated: true)
    }
    
}
