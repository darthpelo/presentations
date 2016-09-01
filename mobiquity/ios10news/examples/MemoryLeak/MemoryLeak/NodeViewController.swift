//
//  NodeViewController.swift
//  MemoryLeak
//
//  Created by Alessio Roberto on 09/08/16.
//  Copyright © 2016 Alessio Roberto. All rights reserved.
//

import UIKit

class NodeViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    let unwind = "unwindToMain"
    var nameList = UYLNode<String>(data: "Tom")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier(unwind, sender: nil)
    }
    
    private func setUpList() {
        let names = ["Dick","Harry"]
        var head = nameList
        for name in names {
            let node = UYLNode<String>(data: name)
            head.next = node
//            head.next = nameList
            head = node
        }
    }

}

class UYLNode<T> {
    var data: T!
    var next: UYLNode?
    
    init(data: T) {
        self.data = data
    }
}
