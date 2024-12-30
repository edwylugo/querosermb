//
//  CoinAppLoadingTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

class CoinAppLoadingTests: XCTestCase {

    var coinAppLoading: CoinAppLoading!
    var mockWindow: UIWindow!

    override func setUp() {
        super.setUp()
        mockWindow = UIWindow(frame: UIScreen.main.bounds)
        coinAppLoading = CoinAppLoading.shared
    }

    override func tearDown() {
        coinAppLoading = nil
        mockWindow = nil
        super.tearDown()
    }

    func testShow() {
        coinAppLoading.show()
        XCTAssertFalse(coinAppLoading.loadingView.isHidden, "The loadingView should be visible.")
    }

    func testHide() {
        coinAppLoading.hide()
        XCTAssertTrue(coinAppLoading.loadingView.isHidden, "The loadingView should be hidden.")
    }

    func testSetBackground() {
        coinAppLoading.setBackground()
        XCTAssertEqual(coinAppLoading.loadingView.backgroundColor, UIColor.white.withAlphaComponent(1.0), "The background color of the loadingView was not set correctly.")
    }
}
