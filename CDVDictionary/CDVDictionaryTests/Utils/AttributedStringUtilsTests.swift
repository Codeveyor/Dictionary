//
//  AttributedStringUtilsTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
import Foundation
@testable import CDVDictionary

class AttributedStringUtilsTests: XCTestCase {
    fileprivate var sut: AttributedStringUtils!
    override func setUp() {
        super.setUp()
        sut = AttributedStringUtils()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCreateAttributedString() {
        let subString = "wo"
        let fullString = "word"

        let attributedString = NSMutableAttributedString(string: fullString)
        let str = NSString(string: fullString)
        let theRange = str.range(of: subString, options: NSString.CompareOptions.caseInsensitive)
        let yellowColor = ColorUtils().yellowColor().withAlphaComponent(0.8)
        attributedString.addAttribute(NSAttributedStringKey.backgroundColor, value: yellowColor, range: theRange)

        let result = sut.createAttributedString(fullString: fullString, subString: subString)
        XCTAssertNotNil(result, "result should be not nil")
        XCTAssertEqual(attributedString, result, "results should be equal")
    }
}
