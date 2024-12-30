//
//  TooltipLabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class TooltipLabelTests: XCTestCase {

    func test_initialization() {
        let label = TooltipLabel()
        
        XCTAssertEqual(label.font, .roboto(type: .regular, size: .tooltip), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .subtileLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = TooltipLabel()
        let content = TooltipLabel.TooltipLabelContent(
            captionText: "Tooltip Example",
            textAlignment: .right,
            textColor: .blue
        )
        
        label.configure(content: content)
        
        XCTAssertEqual(label.text, "Tooltip Example", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .right, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .blue, "The text color was not configured correctly.")
    }
}
