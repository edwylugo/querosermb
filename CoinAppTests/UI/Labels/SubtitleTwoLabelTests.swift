//
//  SubtitleTwoLabelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class SubtitleTwoLabelTests: XCTestCase {

    func test_initialization() {
        let label = SubtitleTwoLabel()
        
        XCTAssertEqual(label.font, .roboto(type: .medium, size: .subtitle2), "The initial font is incorrect.")
        XCTAssertNotEqual(label.textColor, .titleLabel(), "The initial color is incorrect.")
        XCTAssertEqual(label.numberOfLines, 0, "The initial number of lines is incorrect.")
    }

    func test_configure_updatesProperties() {
        let label = SubtitleTwoLabel()
        let content = SubtitleTwoLabel.SubtitleTwoLabelContent(
            subtitleTwoText: "Subtitle Example",
            textAlignment: .right,
            textColor: .red
        )
        
        label.configure(content: content)
        
        XCTAssertEqual(label.text, "Subtitle Example", "The text was not configured correctly.")
        XCTAssertEqual(label.textAlignment, .right, "The text alignment was not configured correctly.")
        XCTAssertEqual(label.textColor, .red, "The text color was not configured correctly.")
    }
}
