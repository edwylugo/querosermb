//
//  UIFontTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

final class UIFontTests: XCTestCase {

    func testFontSizeValues() {
        XCTAssertEqual(UIFont.Size.h1.value, 96.0)
        XCTAssertEqual(UIFont.Size.h2.value, 60.0)
        XCTAssertEqual(UIFont.Size.h3.value, 48.0)
        XCTAssertEqual(UIFont.Size.h4.value, 34.0)
        XCTAssertEqual(UIFont.Size.h5.value, 24.0)
        XCTAssertEqual(UIFont.Size.h6.value, 20.0)
        XCTAssertEqual(UIFont.Size.avatarLetter.value, 20.0)
        XCTAssertEqual(UIFont.Size.subtitle1.value, 16.0)
        XCTAssertEqual(UIFont.Size.body1.value, 16.0)
        XCTAssertEqual(UIFont.Size.inputText.value, 16.0)
        XCTAssertEqual(UIFont.Size.subtitle2.value, 14.0)
        XCTAssertEqual(UIFont.Size.body2.value, 14.0)
        XCTAssertEqual(UIFont.Size.buttonMedium.value, 14.0)
        XCTAssertEqual(UIFont.Size.buttonLarge.value, 15.0)
        XCTAssertEqual(UIFont.Size.buttonSmall.value, 13.0)
        XCTAssertEqual(UIFont.Size.caption.value, 12.0)
        XCTAssertEqual(UIFont.Size.overline.value, 12.0)
        XCTAssertEqual(UIFont.Size.inputLabel.value, 12.0)
        XCTAssertEqual(UIFont.Size.helperText.value, 12.0)
        XCTAssertEqual(UIFont.Size.tooltip.value, 10.0)
        XCTAssertEqual(UIFont.Size.fieldLabel.value, 8.0)
    }

    func testRobotoFontExists() {
        let font = UIFont.roboto(type: .regular, size: .h5)
        XCTAssertEqual(font.fontName, "Roboto-Regular")
        XCTAssertEqual(font.pointSize, UIFont.Size.h5.value)
    }

    func testRobotoFallbackToSystemFont() {
        let nonExistentFont = UIFont.roboto(type: .black, size: .h1)
        if let robotoFont = UIFont(name: "Roboto-Black", size: UIFont.Size.h1.value) {
            XCTAssertEqual(nonExistentFont, robotoFont)
        } else {
            XCTAssertEqual(nonExistentFont, UIFont.systemFont(ofSize: UIFont.Size.h1.value))
        }
    }

    func testAllRobotoFonts() {
        for fontType in UIFont.Roboto.allCases {
            let font = UIFont.roboto(type: fontType, size: .body1)
            XCTAssertEqual(font.pointSize, UIFont.Size.body1.value)
        }
    }
}

extension UIFont.Roboto: @retroactive CaseIterable {
    public static var allCases: [UIFont.Roboto] {
        return [
            .black, .blackItalic, .bold, .boldItalic,
            .italic, .light, .lightItalic, .medium,
            .mediumItalic, .regular, .thin, .thinItalic
        ]
    }
}
