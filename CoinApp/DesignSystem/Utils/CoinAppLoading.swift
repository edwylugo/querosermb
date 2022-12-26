//
//  CoinAppLoading.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

public final class CoinAppLoading: NSObject {

    public static let shared = CoinAppLoading()
    private var loadingView = CoinAppLoadingView()

    public override init() {
        super.init()

        guard let window = mainWindow() else { return }
        loadingView.frame = window.bounds
        window.addSubview(loadingView)
    }

    public func show() {

        loadingView.loading.play()
        loadingView.isHidden = false
        guard let window = mainWindow() else { return }
        window.bringSubviewToFront(loadingView)

    }

    public func hide() {
        loadingView.isHidden = true
        loadingView.loading.stop()
    }
    
    public func setBackground() {
        loadingView.backgroundColor = UIColor.white.withAlphaComponent(1.0)
    }

    private func mainWindow() -> UIWindow? {
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return nil}
        return app.window
    }
}
