//
//  DetailsViewControllerTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 27/12/24.
//


import XCTest
@testable import CoinApp
import UIKit

class DetailsViewControllerTests: XCTestCase {
    
    var viewController: DetailsViewController!
    var mockViewModel: MockDetailsViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        mockViewModel = MockDetailsViewModelProtocol()
        viewController = DetailsViewController(viewModel: mockViewModel)
        _ = viewController.view
    }
    
    override func tearDown() {
        viewController = nil
        mockViewModel = nil
        super.tearDown()
    }

    func testViewDidLoad() {
        XCTAssertNotNil(viewController.view)
    }
    
    func testLoadingState() {
        mockViewModel.isLoading.value = true
        XCTAssertTrue(CoinAppLoading.shared.loadingView.loading.isAnimationPlaying)
        
        mockViewModel.isLoading.value = false
        XCTAssertFalse(CoinAppLoading.shared.loadingView.loading.isAnimationPlaying)
    }
}

class MockDetailsViewModelProtocol: DetailsViewModelProtocol {
    var isLoading: Observable<Bool> = Observable(false)
    var isError: Observable<String?> = Observable(nil)
    var exchangesModelData: Observable<[ExchangesModel]> = Observable([])
    var imageUrl: String = ""
    
    func setExchangeTitle() -> H6Label.Configuration {
        return H6Label.Configuration(h6Text: "Mock Exchange", textAlignment: .center, textColor: .black)
    }

    func setNameTitle() -> BodyOneLabel.Configuration {
        return BodyOneLabel.Configuration(bodyOneText: "Mock Exchange Name", textAlignment: .center, textColor: .black)
    }
    
    func setValueHours() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "$1000", textAlignment: .left, textColor: .black)
    }

    func setValueDay() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "$20000", textAlignment: .left, textColor: .black)
    }

    func setValueMonth() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "$50000", textAlignment: .right, textColor: .black)
    }
    
    func setValueDataStart() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "2024-01-01", textAlignment: .left, textColor: .black)
    }

    func setValueDataEnd() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "2024-02-01", textAlignment: .right, textColor: .black)
    }
    
    func setValueDataStartQuote() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "2024-01-01", textAlignment: .left, textColor: .black)
    }

    func setValueDataEndQuote() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(captionText: "2024-01-31", textAlignment: .right, textColor: .black)
    }
}
