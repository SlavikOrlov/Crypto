//
//  LaunchService.swift
//  Crypto
//
//  Created by Slava Orlov on 17.08.2022.
//

import Foundation
import UIKit

final class LaunchService {
    
    // MARK: - Private properties
    
    private var isUserAuthorized: Bool {
        UserDefaults.standard.bool(forKey: "123")
    }
    
    func getRootViewController() -> UIViewController {
        isUserAuthorized ? getTabBar() : getRegistration()
    }
}

private extension LaunchService {
    
    func getTabBar() -> UIViewController {
        MainTabBarController()
    }
    
    func getRegistration() -> UIViewController {
        let customRegistrationView = CustomRegistrationView()
        return RegistrationViewController(
            customRegistrationView: customRegistrationView,
            user: User.getUser()
        )
    }
}
