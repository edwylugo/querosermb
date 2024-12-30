//
//  OperatorsTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

class OperatorsTests: XCTestCase {

    func testStringOperator() {
        var leftString = "Old Value"
        let rightString: String = "New Value"
        
        leftString << rightString
        
        XCTAssertEqual(leftString, "New Value")
    }
    
    func testOptionalStringOperator() {
        var leftString: String? = "Old Value"
        let rightString: String = "New Value"
        
        leftString << rightString
        
        XCTAssertEqual(leftString, "New Value")
    }

    func testIntOperator() {
        var leftInt = 5
        let rightInt: Int = 10
        
        leftInt << rightInt
        
        XCTAssertEqual(leftInt, 10)
    }
    
    func testOptionalIntOperator() {
        var leftInt: Int? = 5
        let rightInt: Int = 10
        
        leftInt << rightInt
        
        XCTAssertEqual(leftInt, 10)
    }
    
    func testBoolOperator() {
        var leftBool = true
        let rightBool: Bool = false
        
        leftBool << rightBool
        
        XCTAssertEqual(leftBool, false)
    }
    
    func testOptionalBoolOperator() {
        var leftBool: Bool? = true
        let rightBool: Bool = false
        
        leftBool << rightBool
        
        XCTAssertEqual(leftBool, false)
    }
    
    func testFloatOperator() {
        var leftFloat: Float = 1.5
        let rightFloat: Float = 2.5
        
        leftFloat << rightFloat
        
        XCTAssertEqual(leftFloat, 2.5)
    }
    
    func testOptionalFloatOperator() {
        var leftFloat: Float? = 1.5
        let rightFloat: Float = 2.5
        
        leftFloat << rightFloat
        
        XCTAssertEqual(leftFloat, 2.5)
    }
    
    func testDoubleOperator() {
        var leftDouble: Double = 1.5
        let rightDouble: Double = 2.5
        
        leftDouble << rightDouble
        
        XCTAssertEqual(leftDouble, 2.5)
    }
    
    func testOptionalDoubleOperator() {
        var leftDouble: Double? = 1.5
        let rightDouble: Double = 2.5
        
        leftDouble << rightDouble
        
        XCTAssertEqual(leftDouble, 2.5)
    }
    
    func testDictionaryOperator() {
        var leftDict: [String: Any] = ["key1": "value1"]
        let rightDict: [String: Any] = ["key1": "newValue1", "key2": "value2"]
        
        leftDict << rightDict
        
        XCTAssertEqual(leftDict["key1"] as? String, "newValue1")
        XCTAssertEqual(leftDict["key2"] as? String, "value2")
    }
    
    func testOptionalDictionaryOperator() {
        var leftDict: [String: Any]? = ["key1": "value1"]
        let rightDict: [String: Any] = ["key1": "newValue1", "key2": "value2"]
        
        leftDict << rightDict
        
        XCTAssertEqual(leftDict?["key1"] as? String, "newValue1")
        XCTAssertEqual(leftDict?["key2"] as? String, "value2")
    }
}
