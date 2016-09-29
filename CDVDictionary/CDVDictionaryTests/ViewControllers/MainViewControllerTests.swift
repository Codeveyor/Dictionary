//
//  MainViewControllerTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import CDVDictionary

class MainViewControllerTests: XCTestCase {
    var sut: MainViewController!
    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.segmentedControl, "segmented control should be connected")
        XCTAssertNotNil(sut.rsContainerView, "rs container view should be connected")
        XCTAssertNotNil(sut.srContainerView, "sr container view should be connected")
        XCTAssertNotNil(sut.infoContainerView, "info container view should be connected")
    }
}
