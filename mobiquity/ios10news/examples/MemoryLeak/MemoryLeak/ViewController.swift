//
//  ViewController.swift
//  MemoryLeak
//
//  Created by Alessio Roberto on 09/08/16.
//  Copyright © 2016 Alessio Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let segueName = "ShowNode"
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(sender: UIButton) {
        self.performSegueWithIdentifier(segueName, sender: nil)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
}

