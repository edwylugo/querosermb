//
//  MetadataWs.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

// MARK: - List all exchanges
/// Get a detailed list of exchanges provided by the system.

class MetadataWs: WebService {

    override init() {
        super.init()
    }
    
    func getExchanges() {
        super.identifier += "getExchanges"
        super.get(url: "\(kWsVersion)/exchanges")
    }
    
    func getExchangeOnly(exchange_id: String) {
        super.identifier += "getExchangeOnly"
        super.get(url: "\(kWsVersion)/exchanges/\(exchange_id)")
    }
    
    func getExchangesIcons() {
        super.identifier += "getExchangesIcons"
        super.get(url: "\(kWsVersion)/exchanges/icons/512")
    }
    
    func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch image with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
            
        }.resume()
    }
}
