//
//  CodeView.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViews()
}

extension CodeView {
    func buildViewHierarchy() {}
    func setupConstraints() {}
    func setupAdditionalConfiguration() {}
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
