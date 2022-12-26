//
//  HomeViewModel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import Foundation

// MARK: - HomeNavigationProtocol - Use in Coordinator

protocol HomeNavigationProtocol: AnyObject {
    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int)
    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int)
    func shouldDetailsExchange(exchange_id: String, imageUrl: String)
}

// MARK: - HomeViewModelProtocol - Protocol definition Use in Controller

protocol HomeViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var exchangesModelData: Observable<[ExchangesModel]> { get }
    var exchangesModelDataWithImage: Observable<[ExchangesModel]> { get }
    func shouldDetailsExchange(exchange_id: String, imageUrl: String)
}

// MARK: - HomeViewModel

final class HomeViewModel: HomeViewModelProtocol {
    private var navigationDelegate: HomeNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var exchangesModelData: Observable<[ExchangesModel]>
    var exchangesModelDataWithImage: Observable<[ExchangesModel]>
   
    // MARK: - Initialization
    
    init(navigationDelegate: HomeNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.exchangesModelData = Observable([])
        self.exchangesModelDataWithImage = Observable([])
        self.getExchanges()
    }
    
    // MARK: - Methods Internal
    
    internal func getExchanges() {
        self.isLoading.value = true
        let metadataWs = MetadataWs()
        metadataWs.delegate = self
        metadataWs.getExchanges()
    }
    
    internal func getExchangesIcons() {
        self.isLoading.value = true
        let metadataWs = MetadataWs()
        metadataWs.delegate = self
        metadataWs.getExchangesIcons()
    }
    
    func shouldDetailsExchange(exchange_id: String, imageUrl: String) {
        navigationDelegate.shouldDetailsExchange(exchange_id: exchange_id, imageUrl: imageUrl)
    }
    
    // MARK: - Methods UI
    
}

extension HomeViewModel: WsDelegate {
    func wsFinishedWithSuccess(identifier: String, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        self.isLoading.value = false
        
        if identifier == "getExchanges" {
            if status == .success {
                if let result = sender.value(forKey: "result") as? NSArray {
                    if result.count != 0 {
                        for resultItem in result {
                                let exchangesModelResponse = ExchangesModel.init(dict: resultItem as! NSDictionary)
                                    exchangesModelData.value.append(exchangesModelResponse)
                        }
                        getExchangesIcons()
                    }
                }
            }
        }
        
        if identifier == "getExchangesIcons" {
            if status == .success {
                if let result = sender.value(forKey: "result") as? NSArray {
                    if result.count != 0 {
                        for resultItem in result {
                            let exchangesModelResponse = ExchangesIconsModel.init(dict: resultItem as! NSDictionary)
                            for item in exchangesModelData.value {
                                if exchangesModelResponse.exchangeID == item.exchangeID {
                                    item.icons = exchangesModelResponse.geturl()
                                    exchangesModelDataWithImage.value.append(item)
                                } else {
                                    exchangesModelDataWithImage.value.append(item)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func wsFinishedWithError(identifier: String, sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        self.isError.value = error
        self.isLoading.value = false
        if status == .noInternet {
            navigationDelegate.errorInternet(
                sender: sender,
                error: error,
                status: status,
                code: code
            )
        } else {
            navigationDelegate.errorGeneric(
                sender: sender,
                error: error,
                status: status,
                code: code
            )
        }
    }
}
