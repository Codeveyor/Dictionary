//
//  PlistReaderUtilsTests.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/27/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import CDVDictionary

class PlistReaderUtilsTests: XCTestCase {
    fileprivate var sut: PlistReaderUtils!
    override func setUp() {
        super.setUp()
        sut = PlistReaderUtils()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testReadingPlist() {
        let result = sut.read("DICT_R-S")
        let sourceArrayCount = result?.sourceArray.count
        let displayDictionaryCount = result?.displayDictionary.count

        XCTAssertNotNil(result, "should have result after reading plist")
        XCTAssertTrue(sourceArrayCount! > 0, "source array sshould not be empty")
        XCTAssertTrue(displayDictionaryCount! > 0, "display dictionary sshould not be empty")
        XCTAssertEqual(sourceArrayCount, displayDictionaryCount, "collections should have equal number of items")
    }
}
