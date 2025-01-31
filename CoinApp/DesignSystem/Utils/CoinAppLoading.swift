//
//  CoinAppLoading.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

final class CoinAppLoading: NSObject {
    
    static let shared = CoinAppLoading()
    var loadingView = CoinAppLoadingView()
    
    override init() {
        super.init()
        guard let window = mainWindow() else { return }
        loadingView.frame = window.bounds
        window.addSubview(loadingView)
    }
    
    func show() {
        loadingView.loading.play()
        loadingView.isHidden = false
        guard let window = mainWindow() else { return }
        window.bringSubviewToFront(loadingView)
        
    }
    
    func hide() {
        loadingView.isHidden = true
        loadingView.loading.stop()
    }
    
    func setBackground() {
        loadingView.backgroundColor = UIColor.white.withAlphaComponent(1.0)
    }
    
    private func mainWindow() -> UIWindow? {
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return nil}
        return app.window
    }
}
