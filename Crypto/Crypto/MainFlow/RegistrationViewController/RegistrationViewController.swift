//
//  ViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Constants
    
    var customRegistrationView: CustomRegistrationView
    private let user: User
    
    // MARK: - Initialization
    
    init(customLoginView: CustomRegistrationView, user: User) {
        self.customRegistrationView = customLoginView
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background()
        addConstraints()
        customRegistrationView.emailTextField.delegate = self
        customRegistrationView.passwordTextField.delegate = self
        self.customRegistrationView.buttonAction = tapButtonEnter
        self.hideKeyboard()
    }
    
    //MARK: - Private Methods
    
    private func background() {
        let gradientLayer: CAGradientLayer = CustomColor.gradientLayer
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    private func addConstraints() {
        view.addSubview(customRegistrationView)
        customRegistrationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customRegistrationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customRegistrationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customRegistrationView.topAnchor.constraint(equalTo: view.topAnchor),
            customRegistrationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func tapButtonEnter() {
        guard
            customRegistrationView.emailTextField.text == user.login &&
            customRegistrationView.passwordTextField.text == user.password
        else {
            alert()
            return
        }

        let tabBar = MainTabBarController()
        UserDefaults.standard.set(true, forKey: "123")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBar)
    }
}

// MARK: - UIViewController

extension RegistrationViewController {
    
    private func alert() {
        let alert = UIAlertController(
            title: "Error",
            message: "Incorrect login or password",
            preferredStyle: .actionSheet
        )
        let buttonAction = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: { [weak self] _ in
            guard let self = self else {return}
            self.customRegistrationView.emailTextField.text = nil
            self.customRegistrationView.passwordTextField.text = nil
        })
        alert.addAction(buttonAction)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customRegistrationView.emailTextField {
            customRegistrationView.passwordTextField.becomeFirstResponder()
        } else {
            customRegistrationView.passwordTextField.resignFirstResponder()
        }
        return true
    }
}
