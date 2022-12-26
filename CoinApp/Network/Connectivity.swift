//
//  Connectivity.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Alamofire

// MARK: - Retorna valor [Bool] se user esta conectado com a internet.

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
