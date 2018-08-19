//
//  AttributedStringUtilsTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
import Foundation
@testable import Dictionary

class AttributedStringUtilsTests: XCTestCase {

    private var sut: AttributedStringUtils!

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
        let fullNSString = NSString(string: fullString)
        let range = fullNSString.range(of: subString, options: .caseInsensitive)

        attributedString.addAttribute(.backgroundColor,
                                      value: UIColor.attributed,
                                      range: range)

        let result = sut.createAttributedString(fullString: fullString, subString: subString)

        XCTAssertNotNil(result, "result should be not nil")
        XCTAssertEqual(attributedString, result, "results should be equal")
    }
}
