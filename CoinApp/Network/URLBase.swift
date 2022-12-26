//
//  URLBase.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import Foundation

struct URLBase {
    private static let environmentFile = Bundle.main.path(forResource: "environment", ofType: "plist")

    static func baseUrl() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["coinAppBaseUrl"] as? String ?? ""
            }
        }
        return ""
    }

    static func version() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["coinAppVersion"] as? String ?? ""
            }
        }
        return ""
    }
    
    static func apiKey() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["coinAppAPIKey"] as? String ?? ""
            }
        }
        return ""
    }
}

var kWsBaseUrl = URLBase.baseUrl()
let kWsVersion = URLBase.version()
let kWsApiKey = URLBase.apiKey()
let kWsTimeOut = 120.0
let kWsTimeOutInterval      = 120.0  // Seconds
let kWsCleanCacheAfterDays  = 10     // Days of clean cache content
let kWsRestoreCacheIfNeeded = false  // Defined if is content can be loaded for storage or not
let kWsShowLog              = true   // Define if show debug logs in console
let kCacheControl           = "private, no-cache, no-store"
