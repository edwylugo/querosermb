//
//  FieldLabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class FieldLabelTests: XCTestCase {

    func test_initialization() {
        let label = FieldLabel()
        
        XCTAssertEqual(label.font, .roboto(type: .regular, size: .fieldLabel), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .subtileLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
        XCTAssertEqual(label.accessibilityIdentifier, "Title", "The initial accessibility identifier is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = FieldLabel()
        let content = FieldLabel.FieldLabelContent(
            captionText: "Example Text",
            textAlignment: .center,
            textColor: .blue
        )
        
        label.configure(content: content)
        
        XCTAssertEqual(label.text, "Example Text", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .center, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .blue, "The text color was not configured correctly.")
    }
}
