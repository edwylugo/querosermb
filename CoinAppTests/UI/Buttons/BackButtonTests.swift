//
//  BackButtonTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

class BackButtonTests: XCTestCase {

    var backButton: BackButton!

    override func setUp() {
        super.setUp()
        backButton = BackButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        backButton.setupViews()
    }

    override func tearDown() {
        backButton = nil
        super.tearDown()
    }

    func testBackButtonSetup() {
        XCTAssertEqual(backButton.backgroundColor, .clear, "The button's background color was not configured correctly.")
        
        XCTAssertEqual(backButton.image(for: .normal), Images.ic_button_back.withRenderingMode(.alwaysTemplate), "The button's image was not configured correctly.")

        XCTAssertNotEqual(backButton.tintColor, .main, "The button's tintColor was not configured correctly.")

        XCTAssertTrue(backButton.isEnabled, "The button is not enabled.")

        XCTAssertTrue(backButton.isUserInteractionEnabled, "User interaction is not enabled for the button.")
    }

    func testBackButtonWidth() {
        backButton.setupConstraints()
        XCTAssertNotEqual(backButton.frame.width, 16, "The button's width was not configured correctly.")
    }
}
