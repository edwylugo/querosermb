//
//  StringExtensionsTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest

@testable import CoinApp

final class StringExtensionsTests: XCTestCase {

    func testFormatDateToEUA_ValidDate() {
        let input = "2024-12-22"
        let expectedOutput = "12/22/2024"
        XCTAssertEqual(input.formatDateToEUA(), expectedOutput)
    }
    
    func testFormatDateToEUA_InvalidDate() {
        let input = "invalid-date"
        let expectedOutput = "-"
        XCTAssertEqual(input.formatDateToEUA(), expectedOutput)
    }
    
    func testFormatDateToEUA_EmptyString() {
        let input = ""
        let expectedOutput = "-"
        XCTAssertEqual(input.formatDateToEUA(), expectedOutput)
    }
    
    func testFormatDateTimeToPtEUADateTime_ValidDateTime() {
        let input = "2024-12-22T14:30:00Z"
        let expectedOutput = "12/22/2024 14:30"
        XCTAssertNotEqual(input.formatDateTimeToPtEUADateTime(), expectedOutput)
    }
    
    func testFormatDateTimeToPtEUADateTime_InvalidDateTime() {
        let input = "2024-12-22"
        XCTAssertEqual(input.formatDateTimeToPtEUADateTime(), input)
    }
    
    func testSubstring_FromTo() {
        let input = "Hello, World!"
        let expectedOutput = "World"
        XCTAssertEqual(input.substring(from: 7, to: 11), expectedOutput)
    }
    
    func testSubstring_From() {
        let input = "Hello, World!"
        let expectedOutput = "World!"
        XCTAssertEqual(input.substring(from: 7), expectedOutput)
    }
    
    func testSubstring_To() {
        let input = "Hello, World!"
        let expectedOutput = "Hello"
        XCTAssertEqual(input.substring(to: 4), expectedOutput)
    }
    
    func testSubstring_FromTo_OutOfRange() {
        let input = "Hello"
        let expectedOutput = ""
        XCTAssertEqual(input.substring(from: 10, to: 15), expectedOutput)
    }
    
    func testSubstring_LengthTo() {
        let input = "Hello, World!"
        let expectedOutput = "World"
        XCTAssertEqual(input.substring(length: 5, to: 11), expectedOutput)
    }
    
    func testSubstring_LengthTo_OutOfRange() {
        let input = "Hello"
        let expectedOutput = ""
        XCTAssertEqual(input.substring(length: 10, to: 5), expectedOutput)
    }
}
