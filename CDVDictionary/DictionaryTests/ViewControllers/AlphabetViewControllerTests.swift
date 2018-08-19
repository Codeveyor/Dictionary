//
//  AlphabetViewControllerTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

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

        XCTAssertEqual(sut.alphabetTableView.rowHeight, UITableViewAutomaticDimension, "row height should be equal to automatic dimension")
        XCTAssertEqual(sut.alphabetTableView.estimatedRowHeight, 56.0, "estimated row height should be equal to 56")
    }
}
