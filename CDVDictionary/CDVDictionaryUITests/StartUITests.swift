//
//  StartUITests.swift
//  StartUITests
//
//  Created by Alex Golub on 2/1/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest

class StartUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSwitchSegments() {
        
    }
}
