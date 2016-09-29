//
//  AlphabetViewControllerTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import CDVDictionary

class AlphabetViewControllerTests: XCTestCase {
    var sut: AlphabetViewController!
    override func setUp() {
        super.setUp()
        let navigationController = UINavigationController()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlphabetViewController") as! AlphabetViewController
        navigationController.addChildViewController(sut)
        sut.dictionaryName = "dictionaryName"
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.alphabetTableView, "table view should be connected")
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self), "view controller should conform UITableViewDataSource protocol")
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self), "view controller should conform UITableViewDelegate protocol")
    }
}
