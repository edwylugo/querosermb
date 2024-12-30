//
//  WsStatusTests.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/24.
//

import XCTest
@testable import CoinApp

class WsStatusTests: XCTestCase {

    func testCodeStatus() {
        
        let statusCodeMapping: [(WsStatus, Int)] = [
            (.success, 200),
            (.created, 201),
            (.accepted, 202),
            (.noContent, 204),
            (.notModified, 304),
            (.badRequest, 400),
            (.unauthorized, 401),
            (.forbidden, 403),
            (.notFound, 404),
            (.methodNotAllowed, 405),
            (.requestTimeOut, 408),
            (.internalServerError, 500),
            (.noInternet, -1),
            (.conflict, 409),
            (.undefined, 99),
            (.tooManyRequests, 429),
            (.noData, 550)
        ]
        
        for (status, expectedCode) in statusCodeMapping {
            XCTAssertEqual(status.codeStatus, expectedCode, "For \(status), expected status code \(expectedCode) but got \(status.codeStatus)")
        }
    }
}
