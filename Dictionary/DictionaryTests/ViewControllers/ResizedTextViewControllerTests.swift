//
//  ResizedTextViewControllerTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class ResizedTextViewControllerTests: XCTestCase {
    var sut: ResizedTextViewController!
    override func setUp() {
        super.setUp()
        let navigationController = UINavigationController()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResizedTextViewController") as! ResizedTextViewController
        navigationController.addChildViewController(sut)
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.textTableView, "table view should be connected")
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self), "view controller should conform UITableViewDataSource protocol")
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self), "view controller should conform UITableViewDelegate protocol")
    }
}
