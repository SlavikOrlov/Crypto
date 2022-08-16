//
//  ProfileViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Exit to Registration", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = CustomColor.buttonColor
        button.addTarget(self, action: #selector(tapLogOutButtonEnter), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.backgroundTableViewColor
        view.addSubview(logOutButton)
        addConstraints()
        title = "CryptoProfile"
    }
    
    //MARK: - Private Methods
    
    private func addConstraints() {
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutButton.widthAnchor.constraint(equalToConstant: 60),
            logOutButton.heightAnchor.constraint(equalToConstant: 40),
            logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    @objc func tapLogOutButtonEnter() {
        let registrationViewController = RegistrationViewController(
            customLoginView: CustomView(),
            user: User.getUser()
        )
        UserDefaults.standard.set(false, forKey: "123")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(registrationViewController)
        UserDefaults.standard.removeObject(forKey: "selectedIndex")
    }
}
