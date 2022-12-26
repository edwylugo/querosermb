//
//  BackButton.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class BackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BackButton: CodeView {
    func setupConstraints() {
        setWidth(width: 16)
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .clear
        setImage(Images.ic_button_back.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = .main
        isEnabled = true
        isUserInteractionEnabled = true
    }
}

