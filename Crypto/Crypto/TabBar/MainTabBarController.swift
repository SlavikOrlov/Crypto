//
//  TabBarConfigurator.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit


final class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.barTintColor = CustomColor.backgroundTableViewColor
    }
    
    //MARK: - Private Methods
    
    private func getViewControllers() {
        let walletViewController = UINavigationController(
            rootViewController: WalletViewController()
        )
        let profileViewController = UINavigationController(
            rootViewController: ProfileViewController()
        )
        walletViewController.tabBarItem = UITabBarItem(
            title: "CryptoWallet",
            image: UIImage(named: "mainTab"),
            selectedImage: UIImage(named: "mainTab")
        )
        profileViewController.tabBarItem = UITabBarItem(
            title: "CryptoProfile",
            image: UIImage(named: "profileTab"),
            selectedImage: UIImage(named: "profileTab")
        )
        viewControllers = [walletViewController, profileViewController]
    }
}
