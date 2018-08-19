//
//  RoundedViewTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class RoundedViewTests: XCTestCase {
    var sut: RoundedView!
    override func setUp() {
        super.setUp()
        sut = RoundedView()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSetViewBackgroundColor() {
        let testRadius: CGFloat = 15.0

        sut.cornerRadius = testRadius

        XCTAssertEqual(testRadius, sut.layer.cornerRadius, "view's radius should be set")
    }
}
