//
//  UIViewExtensionTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 22/12/24.
//

import XCTest
@testable import CoinApp

final class UIViewExtensionTests: XCTestCase {
    
    func testAnchorConstraints() {
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let childView = UIView()
        parentView.addSubview(childView)
        
        childView.anchor(top: parentView.topAnchor, paddingTop: 10,
                         leading: parentView.leadingAnchor, paddingLeft: 15,
                         bottom: parentView.bottomAnchor, paddingBottom: 20,
                         trailing: parentView.trailingAnchor, paddingRight: 25,
                         width: 100, height: 50)
        
        XCTAssertNotNil(childView.constraints.first { $0.constant == 50 && $0.firstAttribute == .height })
        XCTAssertNotNil(childView.constraints.first { $0.constant == 100 && $0.firstAttribute == .width })
    }
    
    func testSetHeightAndWidth() {
        let view = UIView()
        view.setHeight(height: 50)
        view.setWidth(width: 100)
        
        XCTAssertTrue(view.constraints.contains { $0.constant == 50 && $0.firstAttribute == .height })
        XCTAssertTrue(view.constraints.contains { $0.constant == 100 && $0.firstAttribute == .width })
    }
    
    func testRoundCorners() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.roundCorners([.topLeft, .bottomRight], 10)
        
        XCTAssertNotNil(view.layer.mask as? CAShapeLayer)
    }
    
    func testRemoveAllConstraints() {
        let parentView = UIView()
        let childView = UIView()
        parentView.addSubview(childView)
        
        childView.setHeight(height: 50)
        childView.setWidth(width: 100)
        
        childView.removeAllConstraints()
        
        XCTAssertTrue(childView.constraints.isEmpty)
        XCTAssertEqual(childView.translatesAutoresizingMaskIntoConstraints, true)
    }
}
