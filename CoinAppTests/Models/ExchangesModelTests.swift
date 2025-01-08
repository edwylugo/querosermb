//
//  ExchangesModelTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class ExchangesModelTests: XCTestCase {

    func testInitFromDictionary() {
        let sampleDict: [String: Any] = [
            "exchange_id": "123",
            "website": "https://example.com",
            "name": "Example Exchange",
            "data_start": "2023-01-01",
            "data_end": "2023-12-31",
            "data_quote_start": "2023-01-01T00:00:00Z",
            "data_quote_end": "2023-12-31T23:59:59Z",
            "data_orderbook_start": "2023-01-01T00:00:00Z",
            "data_orderbook_end": "2023-12-31T23:59:59Z",
            "data_trade_start": "2023-01-01T00:00:00Z",
            "data_trade_end": "2023-12-31T23:59:59Z",
            "data_symbols_count": 100,
            "volume_1hrs_usd": 1000.0,
            "volume_1day_usd": 20000.0,
            "volume_1mth_usd": 300000.0,
            "metric_id": ["metric1", "metric2"]
        ]
        
        let model = ExchangesModel(dict: sampleDict)

        XCTAssertEqual(model.exchangeID, "123", "Exchange ID should be correctly initialized.")
        XCTAssertEqual(model.website, "https://example.com", "Website should be correctly initialized.")
        XCTAssertEqual(model.name, "Example Exchange", "Name should be correctly initialized.")
        XCTAssertEqual(model.dataStart, "2023-01-01", "Data Start should be correctly initialized.")
        XCTAssertEqual(model.dataEnd, "2023-12-31", "Data End should be correctly initialized.")
        XCTAssertEqual(model.dataQuoteStart, "2023-01-01T00:00:00Z", "Data Quote Start should be correctly initialized.")
        XCTAssertEqual(model.dataQuoteEnd, "2023-12-31T23:59:59Z", "Data Quote End should be correctly initialized.")
        XCTAssertEqual(model.dataOrderbookStart, "2023-01-01T00:00:00Z", "Data Orderbook Start should be correctly initialized.")
        XCTAssertEqual(model.dataOrderbookEnd, "2023-12-31T23:59:59Z", "Data Orderbook End should be correctly initialized.")
        XCTAssertEqual(model.dataTradeStart, "2023-01-01T00:00:00Z", "Data Trade Start should be correctly initialized.")
        XCTAssertEqual(model.dataTradeEnd, "2023-12-31T23:59:59Z", "Data Trade End should be correctly initialized.")
        XCTAssertEqual(model.dataSymbolsCount, 100, "Data Symbols Count should be correctly initialized.")
        XCTAssertEqual(model.volume1HrsUsd, 1000.0, "Volume 1Hrs USD should be correctly initialized.")
        XCTAssertEqual(model.volume1DayUsd, 20000.0, "Volume 1Day USD should be correctly initialized.")
        XCTAssertEqual(model.volume1MthUsd, 300000.0, "Volume 1Mth USD should be correctly initialized.")
        XCTAssertEqual(model.metricID, ["metric1", "metric2"], "Metric ID should be correctly initialized.")
    }

    func testGetterMethods() {
        let model = ExchangesModel()
        model.exchangeID = "456"
        model.website = "https://test.com"
        model.name = "Test Exchange"
        model.dataStart = "2024-01-01"
        model.dataEnd = "2024-12-31"
        model.dataQuoteStart = "2024-01-01T00:00:00Z"
        model.dataQuoteEnd = "2024-12-31T23:59:59Z"
        model.dataSymbolsCount = 200
        model.volume1HrsUsd = 500.0
        model.volume1DayUsd = 10000.0
        model.volume1MthUsd = 150000.0
        model.metricID = ["metric3", "metric4"]
        
        XCTAssertEqual(model.exchangeID, "456")
        XCTAssertEqual(model.website, "https://test.com")
        XCTAssertEqual(model.name, "Test Exchange")
        XCTAssertEqual(model.dataStart, "2024-01-01")
        XCTAssertEqual(model.dataEnd, "2024-12-31")
        XCTAssertEqual(model.dataQuoteStart, "2024-01-01T00:00:00Z")
        XCTAssertEqual(model.dataQuoteEnd, "2024-12-31T23:59:59Z")
        XCTAssertEqual(model.dataSymbolsCount, 200)
        XCTAssertEqual(model.volume1HrsUsd, 500.0)
        XCTAssertEqual(model.volume1DayUsd, 10000.0)
        XCTAssertEqual(model.volume1MthUsd, 150000.0)
        XCTAssertEqual(model.metricID, ["metric3", "metric4"])
    }
}
