//
//  Connectivity.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
