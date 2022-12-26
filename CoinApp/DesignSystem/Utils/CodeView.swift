//
//  CodeView.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation

public protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViews()
}

public extension CodeView {
    func buildViewHierarchy() {}
    func setupConstraints() {}
    func setupAdditionalConfiguration() {}
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
