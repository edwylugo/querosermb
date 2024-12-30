//
//  LogoImageViewTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class LogoImageViewTests: XCTestCase {
    
    func test_initializationWithFrame() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let imageView = LogoImageView(frame: frame)
        
        XCTAssertEqual(imageView.frame, frame, "The initial frame is incorrect.")
        
        XCTAssertEqual(imageView.image, Images.logo.withRenderingMode(.alwaysOriginal), "The initial image is incorrect.")
        XCTAssertEqual(imageView.contentMode, .scaleAspectFit, "The initial contentMode is incorrect.")
    }
}

