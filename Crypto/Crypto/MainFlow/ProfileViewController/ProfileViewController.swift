//
//  ProfileViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ExtensionImage.detailViewImage
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Slava Orlov"
        label.textAlignment = .center
        label.textColor = CustomColor.textColor
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "My coin crypto wallet"
        label.textAlignment = .center
        label.textColor = CustomColor.textColor
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.backgroundTableViewColor
        title = "CryptoProfile"
        configureNavigationBar()
        view.addSubview(iconImage)
        view.addSubview(firstNameLabel)
        view.addSubview(descriptionLabel)
        addConstraints()
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
    
    private func addConstraints() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.widthAnchor.constraint(
                equalToConstant: 150
            ),
            iconImage.heightAnchor.constraint(
                equalToConstant: 150
            ),
            iconImage.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor,
                constant: 40
            ),
            iconImage.topAnchor.constraint(
                equalTo: self.view.topAnchor,
                constant: 150
            ),
            firstNameLabel.topAnchor.constraint(
                equalTo: self.view.topAnchor,
                constant: 180
            ),
            firstNameLabel.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor,
                constant: -80
            ),
            firstNameLabel.heightAnchor.constraint(
                equalToConstant: 50
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: self.firstNameLabel.bottomAnchor,
                constant: 20
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor,
                constant: -45
            ),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: 50
            ),
        ])
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
