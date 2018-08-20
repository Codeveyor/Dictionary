//
//  UIColor+Attributed.swift
//  Dictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class ColorUtilsTests: XCTestCase {

    func testAttributedColor() {
        guard let testColor = UIColor(named: "attributed") else {
            XCTAssert(true, "unable to obtain attributed color")
            return
        }

        let attributedColor = UIColor.attributed

        XCTAssertEqual(testColor, attributedColor, "colors should be equal")
    }

    func testBaseColor() {
        guard let testColor = UIColor(named: "base") else {
            XCTAssert(true, "unable to obtain base color")
            return
        }

        let baseColor = UIColor.base

        XCTAssertEqual(testColor, baseColor, "colors should be equal")
    }

    func testBaseCellColor() {
        guard let testColor = UIColor(named: "baseCell") else {
            XCTAssert(true, "unable to obtain baseCell color")
            return
        }

        let baseCellColor = UIColor.baseCell

        XCTAssertEqual(testColor, baseCellColor, "colors should be equal")
    }

    func testBlackCustomColor() {
        guard let testColor = UIColor(named: "blackCustom") else {
            XCTAssert(true, "unable to obtain blackCustom color")
            return
        }

        let blackCustomColor = UIColor.blackCustom

        XCTAssertEqual(testColor, blackCustomColor, "colors should be equal")
    }
}
