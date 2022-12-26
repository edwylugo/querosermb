//
//  HomeCoordinator.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator{
    func start()
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .home }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        let viewModel = HomeViewModel(navigationDelegate: self)
        let viewController = HomeController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeNavigationProtocol

extension HomeCoordinator: HomeNavigationProtocol {
    func shouldDetailsExchange(exchange_id: String, imageUrl: String) {
        let coordinator = DetailsCoordinator(navigationController)
        addChildCoordinator(coordinator)
        coordinator.details(exchange_id: exchange_id, imageUrl: imageUrl)
    }
    
    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        
    }
    
    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        
    }
}
