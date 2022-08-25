//
//  SceneDelegate.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private var launchService = LaunchService()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = launchService.getRootViewController()
        self.window?.makeKeyAndVisible()
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }
        window.rootViewController = vc
        UIView.transition(
            with: window,
            duration: 1,
            options: [.transitionFlipFromRight],
            animations: nil,
            completion: nil
        )
    }
}
