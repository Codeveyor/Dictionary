//
//  StartUITests.swift
//  StartUITests
//
//  Created by Alex Golub on 2/1/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest

class StartUITests: XCTestCase {

    private let application = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        setupSnapshot(application)
        application.launch()
    }

    func testSwitchSegments() {
        let rsLabel = "Р→С"
        let srLabel = "S→R"
        let iLabel = "ℹ︎"

        let mainViewNavigationBar = application.navigationBars["Dictionary.MainView"]
        let srSegment = mainViewNavigationBar.segmentedControls.buttons[srLabel]
        snapshot("rsSegment")
        srSegment.tap()
        let iSegment = mainViewNavigationBar.segmentedControls.buttons[iLabel]
        snapshot("srSegment")
        iSegment.tap()
        let rsSegment = mainViewNavigationBar.segmentedControls.buttons[rsLabel]
        snapshot("iSegment")
        rsSegment.tap()

        XCTAssertEqual(rsLabel, rsSegment.label, "rs segment label should match")
        XCTAssertEqual(srLabel, srSegment.label, "sr segment label should match")
        XCTAssertEqual(iLabel, iSegment.label, "i segment label should match")
    }
}
