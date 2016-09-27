//
//  NavigationBarStyleUtilsTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import CDVDictionary

class NavigationBarStyleUtilsTests: XCTestCase {
    fileprivate var sut: NavigationBarStyleUtils!
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
        XCTAssertEqual(navigationBar.tintColor, ColorUtils().yellowColor(), "navigation bar should have yellow tint color")
    }
}
