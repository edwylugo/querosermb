//
//  LogoImageView.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class LogoImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LogoImageView: CodeView {
    
    func setupAdditionalConfiguration() {
        image = Images.logo.withRenderingMode(.alwaysOriginal)
        contentMode = .scaleAspectFit
    }
}
