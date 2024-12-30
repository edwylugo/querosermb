//
//  DetailsViewModel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation

// MARK: - DetailsNavigationProtocol - Use in Coordinator

protocol DetailsNavigationProtocol: AnyObject {
    func errorInternet(sender: NSDictionary, error: String, status: WsStatus, code: Int)
    func errorGeneric(sender: NSDictionary, error: String, status: WsStatus, code: Int)
}

// MARK: - DetailsViewModelProtocol - Protocol definition Use in Controller

protocol DetailsViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var exchangesModelData: Observable<[ExchangesModel]> { get }
    var imageUrl: String { get }
    func setExchangeTitle() -> H6Label.Configuration
    func setNameTitle() -> BodyOneLabel.Configuration
    func setValueHours() -> CaptionLabel.Configuration
    func setValueDay() -> CaptionLabel.Configuration
    func setValueMonth() -> CaptionLabel.Configuration
    func setValueDataStart() -> CaptionLabel.Configuration
    func setValueDataEnd() -> CaptionLabel.Configuration
    func setValueDataStartQuote() -> CaptionLabel.Configuration
    func setValueDataEndQuote() -> CaptionLabel.Configuration
}

// MARK: - DetailsViewModel

final class DetailsViewModel: DetailsViewModelProtocol {
    private var navigationDelegate: DetailsNavigationProtocol
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var exchangesModelData: Observable<[ExchangesModel]>
    var imageUrl: String
    
    // MARK: - Initialization
    
    init(navigationDelegate: DetailsNavigationProtocol,
         exchange_id: String,
         imageUrl: String
    ) {
        self.navigationDelegate = navigationDelegate
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.exchangesModelData = Observable([])
        self.imageUrl = imageUrl
        self.getExchangeOnly(exchange_id: exchange_id)
    }
    
    // MARK: - Methods Internal
    
    internal func getExchangeOnly(exchange_id: String) {
        self.isLoading.value = true
        let metadataWs = MetadataWs()
        metadataWs.delegate = self
        metadataWs.getExchangeOnly(exchange_id: exchange_id)
    }
    
    // MARK: - Methods UI
    
    func setExchangeTitle() -> H6Label.Configuration {
        return H6Label.Configuration(
            h6Text: exchangesModelData.value.first?.exchangeID ?? "",
            textAlignment: .center,
            textColor: .titleLabel()
        )
    }
    
    func setNameTitle() -> BodyOneLabel.Configuration {
        return BodyOneLabel.Configuration(
            bodyOneText: exchangesModelData.value.first?.name ?? "",
            textAlignment: .center,
            textColor: .subtileLabel()
        )
    }
    
    func setValueHours() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "$ \(exchangesModelData.value.first?.volume1HrsUsd ?? 0.0)",
            textAlignment: .left,
            textColor: .subtileLabel()
        )
    }
    
    func setValueDay() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "$ \(exchangesModelData.value.first?.volume1DayUsd ?? 0.0)",
            textAlignment: .left,
            textColor: .subtileLabel()
        )
    }
    
    func setValueMonth() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "$ \(exchangesModelData.value.first?.volume1MthUsd ?? 0.0)",
            textAlignment: .right,
            textColor: .subtileLabel()
        )
    }
    
    func setValueDataStart() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "\(exchangesModelData.value.first?.dataStart.formatDateToEUA() ?? "")",
            textAlignment: .left,
            textColor: .subtileLabel()
        )
    }
    
    func setValueDataEnd() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "\(exchangesModelData.value.first?.dataEnd.formatDateToEUA() ?? "")",
            textAlignment: .right,
            textColor: .subtileLabel()
        )
    }
    
    func setValueDataStartQuote() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "\(exchangesModelData.value.first?.dataQuoteStart.formatDateTimeToPtEUADateTime() ?? "")",
            textAlignment: .left,
            textColor: .subtileLabel()
        )
    }
    
    func setValueDataEndQuote() -> CaptionLabel.Configuration {
        return CaptionLabel.Configuration(
            captionText: "\(exchangesModelData.value.first?.dataQuoteEnd.formatDateTimeToPtEUADateTime() ?? "")",
            textAlignment: .right,
            textColor: .subtileLabel()
        )
    }
}

extension DetailsViewModel: WsDelegate {
    func wsFinishedWithSuccess(identifier: String, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        self.isLoading.value = false
        
        if identifier == "getExchangeOnly" {
            if status == .success {
                if let result = sender.value(forKey: "result") as? NSArray {
                    if result.count != 0 {
                        for resultItem in result {
                            let exchangesModelResponse = ExchangesModel.init(dict: resultItem as! NSDictionary)
                            exchangesModelData.value.append(exchangesModelResponse)
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
