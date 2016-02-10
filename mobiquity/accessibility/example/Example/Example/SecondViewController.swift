//
//  SecondViewController.swift
//  Example
//
//  Created by Alessio Roberto on 19/01/16.
//  Copyright © 2016 Alessio Roberto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        sectionTitle.image = StyleKitName.imageOfSecondSectoinImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelToSecondViewController(segue:UIStoryboardSegue) {
    }
}

