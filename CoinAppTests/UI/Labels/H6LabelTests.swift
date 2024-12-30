//
//  H6LabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class H6LabelTests: XCTestCase {

    func test_initialization() {
        let label = H6Label()
        
        XCTAssertEqual(label.font, .roboto(type: .regular, size: .h6), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .titleLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = H6Label()
        let content = H6Label.H6LabelContent(
            h6Text: "H6 Title",
            textAlignment: .center,
            textColor: .green
        )
        
        label.configure(content: content)
        
        XCTAssertEqual(label.text, "H6 Title", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .center, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .green, "The text color was not configured correctly.")
    }
}
