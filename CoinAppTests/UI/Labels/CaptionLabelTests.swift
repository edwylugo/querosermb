//
//  CaptionLabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class CaptionLabelTests: XCTestCase {

    func test_initialization() {
        let label = CaptionLabel()

        XCTAssertEqual(label.font, .roboto(type: .regular, size: .caption), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .titleLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = CaptionLabel()
        let content = CaptionLabel.CaptionLabelContent(
            captionText: "Test Caption",
            textAlignment: .center,
            textColor: .red
        )
        
        label.configure(content: content)

        XCTAssertEqual(label.text, "Test Caption", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .center, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .red, "The text color was not configured correctly.")
    }
}
