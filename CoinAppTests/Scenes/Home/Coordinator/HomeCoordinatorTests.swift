//
//  HomeCoordinatorTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class HomeCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = HomeCoordinator(navigationController)
    }
    
    override func tearDown() {
        coordinator = nil
        navigationController = nil
        super.tearDown()
    }
    
    func testHomeCoordinatorInitialization() {
        XCTAssertNotNil(coordinator, "HomeCoordinator should be initialized.")
        XCTAssertTrue(coordinator.navigationController.isNavigationBarHidden, "Navigation bar should be hidden on initialization.")
    }
    
    func testStartMethod() {
        coordinator.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1, "There should be one view controller in the navigation stack.")
        
        let viewController = navigationController.viewControllers.first
        XCTAssertTrue(viewController is HomeController, "The pushed view controller should be of type HomeController.")
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
