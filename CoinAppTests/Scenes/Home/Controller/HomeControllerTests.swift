//
//  HomeControllerTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class HomeControllerTests: XCTestCase {
    
    var homeController: HomeController!
    var mockViewModel: MockHomeViewModel!
    
    override func setUp() {
        super.setUp()
        mockViewModel = MockHomeViewModel()
        homeController = HomeController(viewModel: mockViewModel)
        homeController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        homeController = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    func test_initialViewModelBinding() {
        mockViewModel.isLoading.value = true
        XCTAssertTrue(CoinAppLoading.shared.loadingView.loading.isAnimationPlaying) // Assuming you have a way to check visibility
        
        mockViewModel.isLoading.value = false
        XCTAssertFalse(CoinAppLoading.shared.loadingView.loading.isAnimationPlaying)
    }
    
    func test_shouldDetailsExchange() {
        let exchange = ExchangesModel()
        exchange.exchangeID = "123"
        exchange.icons = "icon_url"
        
        mockViewModel.shouldDetailsExchange(exchange_id: exchange.exchangeID, imageUrl: exchange.icons)
    }
}

class MockHomeViewModel: HomeViewModelProtocol {
    var isLoading: Observable<Bool> = Observable(false)
    var isError: Observable<String?> = Observable(nil)
    var exchangesModelData: Observable<[ExchangesModel]> = Observable([])
    
    func shouldDetailsExchange(exchange_id: String, imageUrl: String) {}
}
