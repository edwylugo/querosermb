//
//  AppDelegate.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [  .foregroundColor: UIColor.white, .font: UIFont.roboto(type: .medium, size: .h6)]

        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = appearance
        navigationBar.tintColor = .white
        navigationBar.barStyle = .default
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.isHidden = true
        navigationBar.scrollEdgeAppearance =  navigationBar.standardAppearance

        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let navController: UINavigationController = .init()
        navController.modalPresentationStyle = .fullScreen
        navController.navigationItem.hidesBackButton = true
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        coordinator = HomeCoordinator.init(navController)
        coordinator?.start()
        
        return true
    }
}
