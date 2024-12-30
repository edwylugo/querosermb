//
//  DetailsViewModelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 27/12/24.
//

import XCTest
@testable import CoinApp

class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
    var wsDelegateMock: WsDelegateMock!
    var navigationDelegateMock: DetailsNavigationProtocolMock!

    override func setUp() {
        super.setUp()
        wsDelegateMock = WsDelegateMock()
        navigationDelegateMock = DetailsNavigationProtocolMock()
        viewModel = DetailsViewModel(navigationDelegate: navigationDelegateMock, exchange_id: "12345", imageUrl: "http://example.com/image.png")
    }

    override func tearDown() {
        viewModel = nil
        wsDelegateMock = nil
        navigationDelegateMock = nil
        super.tearDown()
    }

    func testGetExchangeOnlySuccess() {
        let jsonResponse = [
            "result": [
                ["exchangeID": "123", "name": "Exchange", "volume1HrsUsd": 100.0, "volume1DayUsd": 1000.0, "volume1MthUsd": 30000.0, "dataStart": "2024-01-01", "dataEnd": "2024-12-31"]
            ]
        ]
        let sender = jsonResponse as NSDictionary
        viewModel.wsFinishedWithSuccess(identifier: "getExchangeOnly", sender: sender, status: .success, jsonResult: NSMutableArray())

        XCTAssertTrue(viewModel.isLoading.value == false)
        XCTAssertEqual(viewModel.exchangesModelData.value.count, 1)
        XCTAssertEqual(viewModel.exchangesModelData.value.first?.name, "Exchange")
    }

    func testGetExchangeOnlyError() {

        let errorMessage = "Failed to fetch exchange data"
        let sender = NSDictionary()
        viewModel.wsFinishedWithError(identifier: "getExchangeOnly", sender: sender, error: errorMessage, status: .internalServerError, code: 500)

        XCTAssertTrue(viewModel.isLoading.value == false)
        XCTAssertEqual(viewModel.isError.value, errorMessage)
        XCTAssertTrue(navigationDelegateMock.errorGenericCalled)
    }
}

class DetailsNavigationProtocolMock: DetailsNavigationProtocol {
    var errorInternetCalled = false
    var errorGenericCalled = false

    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        errorInternetCalled = true
    }

    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        errorGenericCalled = true
    }
}

class WsDelegateMock: WsDelegate {
    var wsFinishedWithSuccessCalled = false
    var wsFinishedWithErrorCalled = false

    func wsFinishedWithSuccess(identifier: String, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        wsFinishedWithSuccessCalled = true
    }

    func wsFinishedWithError(identifier: String, sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        wsFinishedWithErrorCalled = true
    }
}
