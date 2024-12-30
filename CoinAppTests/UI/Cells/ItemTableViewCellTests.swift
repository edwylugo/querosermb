//
//  ItemTableViewCellTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

final class ItemTableViewCellTests: XCTestCase {

    func test_initialization() {
        let cell = ItemTableViewCell(style: .default, reuseIdentifier: "ItemTableViewCell")
        
        XCTAssertNotNil(cell.itemExchangesView, "The itemExchangesView was not initialized correctly.")
        XCTAssertTrue(cell.contentView.subviews.contains(cell.itemExchangesView), "The itemExchangesView was not added to the contentView.")
    }
    
    func test_constraintsSetup() {
        let cell = ItemTableViewCell(style: .default, reuseIdentifier: "ItemTableViewCell")
        cell.layoutIfNeeded()
        
        XCTAssertEqual(cell.itemExchangesView.frame, cell.contentView.bounds, "The constraints of itemExchangesView were not set up correctly.")
    }
}
