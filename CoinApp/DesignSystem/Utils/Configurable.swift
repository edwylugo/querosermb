//
//  Configurable.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

public protocol Configurable: AnyObject {
    associatedtype Configuration

    func configure(content: Configuration)

}
