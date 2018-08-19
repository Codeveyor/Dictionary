//
//  NavigationBarStyleUtilsTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class NavigationBarStyleUtilsTests: XCTestCase {

    private var sut: NavigationBarStyleUtils!
    
    override func setUp() {
        super.setUp()
        sut = NavigationBarStyleUtils()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNavigationBarStyle() {
        let navigationBar = UINavigationBar()

        sut.style(navigationBar: navigationBar)
        XCTAssertEqual(navigationBar.tintColor, .base, "navigation bar should have base tint color")
    }
}
