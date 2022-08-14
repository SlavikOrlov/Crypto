//
//  ViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Constants
    
    var customLoginView: CustomLoginView
    private let user: User

    // MARK: - Initialization
    
    init(customLoginView: CustomLoginView, user: User) {
        self.customLoginView = customLoginView
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
        customLoginView.emailTextField.delegate = self
        customLoginView.passwordTextField.delegate = self
        self.customLoginView.buttonAction = tapButtonEnter
        self.hideKeyboard()
    }
    
    //MARK: - Private Methods
    
    private func background() {
        let gradientLayer: CAGradientLayer = CustomColor.gradientLayer
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    private func addConstraints() {
        view.addSubview(customLoginView)
        customLoginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customLoginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customLoginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customLoginView.topAnchor.constraint(equalTo: view.topAnchor),
            customLoginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func tapButtonEnter() {
        guard
            customLoginView.emailTextField.text == user.login &&
            customLoginView.passwordTextField.text == user.password
        else {
            alert()
            return
            }
            let walletViewController = WalletViewController()
            UserDefaults.standard.set(true, forKey: "Logged_in")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(walletViewController)
        }
    }

// MARK: - UIViewController

extension RegistrationViewController {
    
    private func alert() {
        let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .actionSheet)
        let buttonAction = UIAlertAction(title: "OK", style: .cancel,
                                        handler: { [weak self] _ in
            guard let self = self else {return}
            self.customLoginView.emailTextField.text = nil
            self.customLoginView.passwordTextField.text = nil
        })
        alert.addAction(buttonAction)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Убрать клавиатуру")
        if textField == customLoginView.passwordTextField {
            self.customLoginView.passwordTextField.resignFirstResponder()
        }
        return true
    }
}
