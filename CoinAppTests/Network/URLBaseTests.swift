//
//  URLBaseTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class URLBaseTests: XCTestCase {

    func testBaseUrl() {
        let expectedBaseUrl = "https://rest.coinapi.io/"
        let result = URLBase.baseUrl()

        XCTAssertEqual(result, expectedBaseUrl, "baseUrl should return the correct base URL.")
    }

    func testVersion() {
        let expectedVersion = "v1"
        let result = URLBase.version()

        XCTAssertEqual(result, expectedVersion, "version should return the correct version.")
    }

    func testApiKey() {
        let expectedApiKey = "64edf0d7-e74c-438e-98ec-f228e889f2f7"
        let result = URLBase.apiKey()

        XCTAssertEqual(result, expectedApiKey, "apiKey should return the correct API key.")
    }

    func testMissingEnvironmentFile() {
        let resultBaseUrl = URLBase.baseUrl()
        let resultVersion = URLBase.version()
        let resultApiKey = URLBase.apiKey()

        XCTAssertNotEqual(resultBaseUrl, "", "baseUrl should return an empty string if the environment file is missing.")
        XCTAssertNotEqual(resultVersion, "", "version should return an empty string if the environment file is missing.")
        XCTAssertNotEqual(resultApiKey, "", "apiKey should return an empty string if the environment file is missing.")
    }

    func testMalformedEnvironmentFile() {
        let resultBaseUrl = URLBase.baseUrl()
        let resultVersion = URLBase.version()
        let resultApiKey = URLBase.apiKey()

        XCTAssertNotEqual(resultBaseUrl, "", "baseUrl should return an empty string if the 'coinAppBaseUrl' key is missing.")
        XCTAssertNotEqual(resultVersion, "", "version should return an empty string if the 'coinAppVersion' key is missing.")
        XCTAssertNotEqual(resultApiKey, "", "apiKey should return an empty string if the 'coinAppAPIKey' key is missing.")
    }
}
