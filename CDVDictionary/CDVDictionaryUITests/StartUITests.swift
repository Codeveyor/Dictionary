//
//  StartUITests.swift
//  StartUITests
//
//  Created by Alex Golub on 2/1/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest

class StartUITests: XCTestCase {
    fileprivate let application = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application.launch()
    }

    func testSwitchSegments() {
        let rsLabel = "Р→С"
        let srLabel = "S→R"
        let iLabel = "ℹ︎"

        let cdvdictionaryMainviewNavigationBar = application.navigationBars["CDVDictionary.MainView"]
        let srSegment = cdvdictionaryMainviewNavigationBar.segmentedControls.buttons[srLabel]
        srSegment.tap()
        let iSegment = cdvdictionaryMainviewNavigationBar.segmentedControls.buttons[iLabel]
        iSegment.tap()
        let rsSegment = cdvdictionaryMainviewNavigationBar.segmentedControls.buttons[rsLabel]
        rsSegment.tap()

        XCTAssertEqual(rsLabel, rsSegment.label, "rs segment label should match")
        XCTAssertEqual(srLabel, srSegment.label, "sr segment label should match")
        XCTAssertEqual(iLabel, iSegment.label, "i segment label should match")
    }
}
