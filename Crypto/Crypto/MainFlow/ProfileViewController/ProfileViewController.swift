//
//  ProfileViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.backgroundTableViewColor
        title = "CryptoProfile"
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - Private Methods
    
    private func configureNavigationBar() {
        
    let logOutButton = createCustomButton(
        titleName: "< LogOut",
        selector: #selector(tapLogOutButtonEnter)
    )
    navigationItem.leftBarButtonItem = logOutButton
    }
    
    //MARK: - Actions

    @objc func tapLogOutButtonEnter() {
        let registrationViewController = RegistrationViewController(
            customRegistrationView: CustomRegistrationView(),
            user: User.getUser()
        )
        UserDefaults.standard.set(false, forKey: "123")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(registrationViewController)
        UserDefaults.standard.removeObject(forKey: "selectedIndex")
    }
}
