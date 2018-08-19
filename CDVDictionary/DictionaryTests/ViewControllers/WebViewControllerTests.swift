//
//  WebViewControllerTests.swift
//  Dictionary
//
//  Created by Alex Golub on 9/29/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import Dictionary

class WebViewControllerTests: XCTestCase {
    var sut: WebViewController!
    override func setUp() {
        super.setUp()
        let navigationController = UINavigationController()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        navigationController.addChildViewController(sut)
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetup() {
        XCTAssertNotNil(sut.webView, "web view should be connected")
    }
}
