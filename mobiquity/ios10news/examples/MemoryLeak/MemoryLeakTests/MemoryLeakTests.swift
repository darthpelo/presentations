//
//  MemoryLeakTests.swift
//  MemoryLeakTests
//
//  Created by Alessio Roberto on 09/08/16.
//  Copyright © 2016 Alessio Roberto. All rights reserved.
//

import XCTest
@testable import MemoryLeak

class MemoryLeakTests: XCTestCase {
    
    var nodevc: MemoryLeak.NodeViewController!
    var mainvc: MemoryLeak.ViewController!
    
    private func setUpViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        self.mainvc = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! MemoryLeak.ViewController
        self.mainvc.loadView()
        self.mainvc.viewDidLoad()
        
        self.nodevc = storyboard.instantiateViewControllerWithIdentifier("NodeVC") as! MemoryLeak.NodeViewController
        self.nodevc.loadView()
        self.nodevc.viewDidLoad()
    }
    
    override func setUp() {
        super.setUp()

        self.setUpViewControllers()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        nodevc = nil
        super.tearDown()
    }
    
    func testNodeVC() {
        XCTAssertNotNil(self.nodevc, "VC is nil")
        XCTAssertNotNil(self.nodevc.closeButton, "Button is nil")
    }
    
    func testMainVC() {
        XCTAssertNotNil(self.mainvc, "Main VC is nil")
        XCTAssertNotNil(self.mainvc.button, "Button is nil")
    }
    
    func testUYLNode() {
        let node = UYLNode(data: "a")
        
        XCTAssertNotNil(node, "Node is nil")
        XCTAssertEqual(node.data, "a")
        XCTAssertNil(node.next)
    }
}
