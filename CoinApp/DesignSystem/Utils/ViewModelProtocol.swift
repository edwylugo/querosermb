//
//  ViewModelProtocol.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}
