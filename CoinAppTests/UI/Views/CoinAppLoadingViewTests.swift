//
//  CoinAppLoadingViewTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
import Lottie
@testable import CoinApp

class CoinAppLoadingViewTests: XCTestCase {

    var loadingView: CoinAppLoadingView!
    
    override func setUp() {
        super.setUp()
        loadingView = CoinAppLoadingView()
    }
    
    override func tearDown() {
        loadingView = nil
        super.tearDown()
    }
    
    func testLoadingViewInitialization() {
        XCTAssertNotNil(loadingView, "CoinAppLoadingView should be initialized")
        XCTAssertNotNil(loadingView.loading, "Loading animation view should be initialized")
    }
}
