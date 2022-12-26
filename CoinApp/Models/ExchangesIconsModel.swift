//
//  ExchangesIconsModel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

final class ExchangesIconsModel {
    var exchangeID, url: String

    init() {
        self.exchangeID = ""
        self.url = ""
    }
    
    public convenience init(dict: Any) {
        self.init()
        if let json = dict as? [String: Any] {
            self.exchangeID << json["exchange_id"]
            self.url << json["url"]
        }
    }
    
    func getexchangeID() -> String {
        return exchangeID
    }
    
    func geturl() -> String {
        return url
    }
}
