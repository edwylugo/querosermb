//
//  ExchangesModel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

final class ExchangesModel {
    var exchangeID: String
    var website: String
    var name, dataStart, dataEnd, dataQuoteStart: String
    var dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd, dataTradeStart: String
    var dataTradeEnd: String
    var dataSymbolsCount: Int
    var volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double
    var icons: String
    var metricID: [String]

    init() {
        self.exchangeID = ""
        self.website = ""
        self.name = "-"
        self.dataStart = ""
        self.dataEnd = ""
        self.dataQuoteStart = ""
        self.dataQuoteEnd = ""
        self.dataOrderbookStart = ""
        self.dataOrderbookEnd = ""
        self.dataTradeStart = ""
        self.dataTradeEnd = ""
        self.dataSymbolsCount = 0
        self.volume1HrsUsd = 0.0
        self.volume1DayUsd = 0.0
        self.volume1MthUsd = 0.0
        self.icons = ""
        self.metricID = []
    }
    
    public convenience init(dict: Any) {
        self.init()
        if let json = dict as? [String: Any] {
            self.exchangeID << json["exchange_id"] // Our exchange identifier
            self.website << json["website"] // Exchange website address
            self.name << json["name"] // Display name of the exchange
            self.dataStart << json["data_start"] // The date of first data point.
            self.dataEnd << json["data_end"] // The date of last data point.
            self.dataQuoteStart << json["data_quote_start"] // The date and time of first quote.
            self.dataQuoteEnd << json["data_quote_end"] // The date and time of last quote.
            self.dataOrderbookStart << json["data_orderbook_start"] // The date and time of first order book.
            self.dataOrderbookEnd << json["data_orderbook_end"] // The date and time of last order book.
            self.dataTradeStart << json["data_trade_start"] // The date and time of first trade.
            self.dataTradeEnd << json["data_trade_end"] // The date and time of last trade.
            self.dataSymbolsCount << json["data_symbols_count"] // The count of all symbols within exchange.
            self.volume1HrsUsd << json["volume_1hrs_usd"] // The usd volume of all symbols from last 1 hour rolling period.
            self.volume1DayUsd << json["volume_1day_usd"] // The usd volume of all symbols from last 1 day rolling period.
            self.volume1MthUsd << json["volume_1mth_usd"] // The usd volume of all symbols from last 1 month rolling period.
            if let metrics = json["metric_id"] as? [String] {
                for item in metrics {
                    self.metricID.append(item)
                }
            }
        }
    }
    
    func getExchangeID() -> String {
        return exchangeID
    }
    
    func getWebsite() -> String {
        return website
    }
    
    func getName() -> String {
        return name
    }
    
    func getDataStart() -> String {
        return dataStart
    }
    
    func getDataEnd() -> String {
        return dataEnd
    }
    
    func getDataQuoteStart() -> String {
        return dataQuoteStart
    }
    
    func getDataQuoteEnd() -> String {
        return dataQuoteEnd
    }
    
    func getDataOrderbookStart() -> String {
        return dataOrderbookStart
    }
    
    func getDataOrderbookEnd() -> String {
        return dataOrderbookEnd
    }
    
    func getDataTradeStart() -> String {
        return dataTradeStart
    }
    
    func getDataTradeEnd() -> String {
        return dataTradeEnd
    }
    
    func getDataSymbolsCount() -> Int {
        return dataSymbolsCount
    }
    
    func getVolume1HrsUsd() -> Double {
        return volume1HrsUsd
    }
    
    func getVolume1DayUsd() -> Double {
        return volume1DayUsd
    }
    
    func getVolume1MthUsd() -> Double {
        return volume1MthUsd
    }
}
