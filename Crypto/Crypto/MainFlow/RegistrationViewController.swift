//
//  ViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit
import SnapKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Constants
    
    private let emailTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let someDefault = UserDefaults.standard
    private let login = "Slava"
    private let password = "12345"
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background()
        configureAppearance()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboard()
    }
    
    //MARK: - Private Methods
    
    private func background() {
        let gradientLayer: CAGradientLayer = CustomColor.gradientLayer
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    private func configureAppearance() {
        
        // Create emailTextField
        
        emailTextField.placeholder = "email"
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(80)
            make.top.equalToSuperview().inset(300)
        }
        
        // Create passwordTextField
        
        passwordTextField.placeholder = "password"
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(80)
            make.top.equalTo(emailTextField).inset(50)
        }
        
        // Create buttonEnter
        
        let buttonEnter = UIButton(type: .system)
        buttonEnter.backgroundColor = CustomColor.buttonColor
        buttonEnter.layer.cornerRadius = 10
        buttonEnter.setTitleColor(.white, for: .normal)
        buttonEnter.setTitle("Enter", for: .normal)
        view.addSubview(buttonEnter)
        buttonEnter.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        buttonEnter.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(passwordTextField).inset(100)
        }
    }
    
    @objc private func tapButton() {
        let WalletViewController = WalletViewController()
        
        if emailTextField.text == login && passwordTextField.text == password {
            someDefault.set(emailTextField.text, forKey: "login")
            someDefault.set(passwordTextField.text, forKey: "password")
            navigationController?.pushViewController(WalletViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .actionSheet)
            let buttonAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.emailTextField.text?.removeAll()
                self.passwordTextField.text?.removeAll()
            }
            alert.addAction(buttonAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Убрать клавиатуру")
        if textField == passwordTextField {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
}
