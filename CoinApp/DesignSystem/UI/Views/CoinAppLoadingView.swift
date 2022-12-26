//
//  CoinAppLoadingView.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Lottie
import UIKit

final class CoinAppLoadingView: UIView {

    var loading: AnimationView!

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.main.withAlphaComponent(0.8)
        setupLoading()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setupLoading() {
        loading = .init(name: "loading")
        loading.contentMode = .scaleAspectFit
        loading.loopMode = .loop
        loading.isHidden = false
        addSubview(loading)

        loading.centerX(inView: self)
        loading.centerY(inView: self)
        loading.setDimension(width: 150, height: 150)
        
        loading.play()
    }
}
