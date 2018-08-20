//
//  DictionaryViewControllerTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class DictionaryViewControllerTests: XCTestCase {

    var sut: DictionaryViewController!

    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SRDictionaryViewController") as! DictionaryViewController
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.searchBar, "search bar should be connected")
        XCTAssertNotNil(sut.dictionaryTableView, "table view should be connected")
        XCTAssertNotNil(sut.dictionaryTableViewBottomConstraint, "table view bottom constaint should be connected")
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self), "view controller should conform UITableViewDataSource protocol")
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self), "view controller should conform UITableViewDelegate protocol")
        XCTAssertTrue(sut.conforms(to: UISearchBarDelegate.self), "view controller should conform UISearchBarDelegate protocol")
    }
}
