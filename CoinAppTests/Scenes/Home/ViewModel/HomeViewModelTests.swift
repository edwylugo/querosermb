//
//  HomeViewModelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockNavigationDelegate: MockHomeNavigationProtocol!
    
    override func setUp() {
        super.setUp()
        mockNavigationDelegate = MockHomeNavigationProtocol()
        
        viewModel = HomeViewModel(navigationDelegate: mockNavigationDelegate)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNavigationDelegate = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(viewModel, "ViewModel should be initialized.")
        XCTAssertNotEqual(viewModel.isLoading.value, false, "isLoading should be false initially.")
        XCTAssertEqual(viewModel.isError.value, "", "isError should be empty initially.")
        XCTAssertTrue(viewModel.exchangesModelData.value.isEmpty, "exchangesModelData should be empty initially.")
    }
    
    func testGetExchanges() {
        let mockResponse: [String: Any] = [
            "result": [
                [
                    "exchange_id": "1",
                    "website": "https://example.com",
                    "name": "Example Exchange",
                    "data_start": "2023-01-01",
                    "data_end": "2023-12-31",
                    "data_symbols_count": 100
                ]
            ]
        ]
        
        let metadataWs = MetadataWs()
        metadataWs.delegate = viewModel
    
        viewModel.wsFinishedWithSuccess(identifier: "getExchanges", sender: mockResponse as NSDictionary, status: .success, jsonResult: [])
        
        XCTAssertEqual(viewModel.exchangesModelData.value.count, 1, "exchangesModelData should contain 1 exchange.")
        XCTAssertEqual(viewModel.exchangesModelData.value.first?.name, "Example Exchange", "The exchange name should be 'Example Exchange'.")
    }
    
    func testGetExchangesError() {
        let errorMessage = "No internet connection"
        let mockErrorResponse: [String: Any] = [:]
        
        viewModel.wsFinishedWithError(identifier: "getExchanges", sender: mockErrorResponse as NSDictionary, error: errorMessage, status: .noInternet, code: 0)
        
        XCTAssertEqual(viewModel.isError.value, errorMessage, "The error message should be set.")
        XCTAssertEqual(viewModel.isLoading.value, false, "isLoading should be false after the error.")
        
        XCTAssertTrue(mockNavigationDelegate.errorInternetCalled, "The errorInternet method should be called.")
    }
    
    func testShouldDetailsExchange() {
        let exchangeId = "123"
        let imageUrl = "https://example.com/image.png"
        
        viewModel.shouldDetailsExchange(exchange_id: exchangeId, imageUrl: imageUrl)
        
        XCTAssertTrue(mockNavigationDelegate.shouldDetailsExchangeCalled, "The shouldDetailsExchange method should be called.")
        XCTAssertEqual(mockNavigationDelegate.exchangeId, exchangeId, "The exchangeId passed to the delegate should be correct.")
        XCTAssertEqual(mockNavigationDelegate.imageUrl, imageUrl, "The imageUrl passed to the delegate should be correct.")
    }
}

class MockHomeNavigationProtocol: HomeNavigationProtocol {
    
    var errorInternetCalled = false
    var errorGenericCalled = false
    var shouldDetailsExchangeCalled = false
    
    var exchangeId: String?
    var imageUrl: String?
    
    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        errorInternetCalled = true
    }
    
    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        errorGenericCalled = true
    }
    
    func shouldDetailsExchange(exchange_id: String, imageUrl: String) {
        shouldDetailsExchangeCalled = true
        self.exchangeId = exchange_id
        self.imageUrl = imageUrl
    }
}
