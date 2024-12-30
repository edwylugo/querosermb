//
//  BodyOneLabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class BodyOneLabelTests: XCTestCase {

    func test_initialization() {
        let label = BodyOneLabel()
        
        XCTAssertEqual(label.font, .roboto(type: .regular, size: .body1), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .bodyOneLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = BodyOneLabel()
        let customFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        let content = BodyOneLabel.BodyOneLabelContent(
            bodyOneText: "Test Text",
            textAlignment: .center,
            textColor: .red,
            font: customFont
        )
        
        label.configure(content: content)
        
        XCTAssertEqual(label.text, "Test Text", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .center, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .red, "The text color was not configured correctly.")
        XCTAssertEqual(label.font, customFont, "The font was not configured correctly.")
    }
}
