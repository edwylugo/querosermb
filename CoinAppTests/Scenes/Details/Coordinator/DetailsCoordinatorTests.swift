//
//  DetailsCoordinatorTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 27/12/24.
//


import XCTest
@testable import CoinApp

class DetailsCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: DetailsCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = DetailsCoordinator(navigationController)
    }
    
    override func tearDown() {
        coordinator = nil
        navigationController = nil
        super.tearDown()
    }
    
    func testDetailsCoordinatorInitialization() {
        XCTAssertNotNil(coordinator, "DetailsCoordinator should be initialized.")
        XCTAssertTrue(coordinator.navigationController.isNavigationBarHidden, "Navigation bar should be hidden on initialization.")
    }
    
    func testStartMethod() {
        coordinator.start()
        XCTAssertEqual(navigationController.viewControllers.count, 0, "There should be no view controllers in the navigation stack initially.")
    }
    
    func testDetailsMethod() {
        let exchange_id = "12345"
        let imageUrl = "https://example.com/image.jpg"
        coordinator.details(exchange_id: exchange_id, imageUrl: imageUrl)
        
        XCTAssertEqual(navigationController.viewControllers.count, 1, "There should be one view controller in the navigation stack.")
        
        let viewController = navigationController.viewControllers.first
        XCTAssertTrue(viewController is DetailsViewController, "The pushed view controller should be of type DetailsViewController.")
    }
    
    func testErrorInternet() {
        let sender: NSDictionary = [:]
        let error = "Internet error"
        let status = WsStatus.internalServerError
        let code = 500
        
        coordinator.errorInternet(sender: sender, error: error, status: status, code: code)
    }
    
    func testErrorGeneric() {
        let sender: NSDictionary = [:]
        let error = "Generic error"
        let status = WsStatus.badRequest
        let code = 400
        
        coordinator.errorGeneric(sender: sender, error: error, status: status, code: code)
    }
}
