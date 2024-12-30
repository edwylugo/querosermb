//
//  UIStackViewExtensionTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

final class UIStackViewExtensionTests: XCTestCase {
    
    func testAddArrangedSubviews() {
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        
        stackView.addArrangedSubviews([view1, view2, view3])
        
        XCTAssertEqual(stackView.arrangedSubviews.count, 3)
        XCTAssertTrue(stackView.arrangedSubviews.contains(view1))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view2))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view3))
    }
    
    func testRemoveFull() {
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        
        stackView.addArrangedSubviews([view1, view2])
        stackView.removeFull(view: view1)
        
        XCTAssertEqual(stackView.arrangedSubviews.count, 1)
        XCTAssertFalse(stackView.arrangedSubviews.contains(view1))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view2))
        XCTAssertNil(view1.superview)
    }
    
    func testRemoveFullAllArrangedSubviews() {
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        
        stackView.addArrangedSubviews([view1, view2, view3])
        stackView.removeFullAllArrangedSubviews()
        
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
        XCTAssertNil(view1.superview)
        XCTAssertNil(view2.superview)
        XCTAssertNil(view3.superview)
    }
}
