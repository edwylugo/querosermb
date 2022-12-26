//
//  DetailsCoordinator.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

protocol DetailsCoordinatorProtocol: Coordinator{
    func details(exchange_id: String, imageUrl: String)
}

final class DetailsCoordinator: DetailsCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .details }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        
    }
    
    func details(exchange_id: String, imageUrl: String) {
        let viewModel = DetailsViewModel(
            navigationDelegate: self,
            exchange_id: exchange_id,
            imageUrl: imageUrl
        )
        
        let viewController = DetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - DetailsNavigationProtocol

extension DetailsCoordinator: DetailsNavigationProtocol {
    func shouldDetailsExchange(exchange_id: String, imageUrl: String) {
//        let coordinator =
    }
    
    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        
    }
    
    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        
    }
}

