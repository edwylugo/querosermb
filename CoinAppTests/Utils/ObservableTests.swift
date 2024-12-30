//
//  ObservableTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

class ObservableTests: XCTestCase {
    
    func testInitialValue() {
        let observable = Observable(5)
        XCTAssertEqual(observable.value, 5)
    }

    func testBindingListener() {
        let observable = Observable(5)
        var receivedValue: Int?
        
        observable.bind { value in
            receivedValue = value
        }
        
        observable.value = 10
        XCTAssertEqual(receivedValue, 10)
    }
    
    func testBindingListenerWithInitialValue() {
        let observable = Observable(5)
        var receivedValue: Int?
        
        observable.bind { value in
            receivedValue = value
        }
        
        XCTAssertEqual(receivedValue, 5)
    }

    func testListenerNotCalledAfterUnbind() {
        let observable = Observable(5)
        var receivedValue: Int?
        
        observable.bind { value in
            receivedValue = value
        }
        
        observable.value = 10
        XCTAssertEqual(receivedValue, 10)
        
        observable.listener = nil
        
        observable.value = 15
        XCTAssertNotEqual(receivedValue, 15)
    }
    
    func testMultipleListeners() {
        let observable = Observable(5)
        var receivedValue1: Int?
        var receivedValue2: Int?
        
        observable.bind { value in
            receivedValue1 = value
        }
        
        observable.bind { value in
            receivedValue2 = value
        }
        
        observable.value = 10
        
        XCTAssertNotEqual(receivedValue1, 10)
        XCTAssertEqual(receivedValue2, 10)
    }
}
