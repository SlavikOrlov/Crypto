//
//  TabBarConfigurator.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit


final class MainTabBarController: UITabBarController {
    
    private let mainTabImage: UIImage? = ExtensionImage.mainTab
    private let profileTabImage: UIImage? = ExtensionImage.profileTab
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.barTintColor = CustomColor.backgroundTableViewColor
        self.tabBar.tintColor = CustomColor.textColor
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
            image: mainTabImage,
            selectedImage: mainTabImage
        )
        profileViewController.tabBarItem = UITabBarItem(
            title: "CryptoProfile",
            image: profileTabImage,
            selectedImage: profileTabImage
        )
        viewControllers = [walletViewController, profileViewController]
    }
}
