//
//  ColorUtilsTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import CDVDictionary

class ColorUtilsTests: XCTestCase {
    fileprivate var sut: ColorUtils!
    override func setUp() {
        super.setUp()
        sut = ColorUtils()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testYellowColor() {
        let testColor = color(r: 205.0, g: 150.0, b: 62.0)
        let yellowColor = sut.yellowColor()

        XCTAssertEqual(testColor, yellowColor, "colors should be equal")
    }

    func testCellYellowColor() {
        let testColor = sut.yellowColor().withAlphaComponent(0.8)
        let yellowColor = sut.cellYellowColor()

        XCTAssertEqual(testColor, yellowColor, "colors should be equal")
    }

    func testAttributedYellowColor() {
        let testColor = sut.attributedYellowColor()
        let yellowColor = sut.cellYellowColor()

        XCTAssertEqual(testColor, yellowColor, "colors should be equal")
    }

    func testBlackColor() {
        let testColor = color(r:51.0, g: 51.0, b: 51.0)
        let yellowColor = sut.blackColor()

        XCTAssertEqual(testColor, yellowColor, "colors should be equal")
    }

    func testCellWhiteColor() {
        let testColor = UIColor.white
        let yellowColor = sut.cellWhiteColor()

        XCTAssertEqual(testColor, yellowColor, "colors should be equal")
    }
}

extension ColorUtilsTests {
    fileprivate func color(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
