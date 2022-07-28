//
//  ViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background()
        initialize()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    private func background() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 94.0/255.0, green: 230.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor,
            UIColor(red: 154.0/255.0, green: 61.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor,
            UIColor(red: 105.0/255.0, green: 18.0/255.0, blue: 213.0/255.0, alpha: 1.0).cgColor,
        ]
        view.layer.addSublayer(gradientLayer)
    }
    
    private func initialize() {
       
        // MARK: - настройка поля логин
        
        emailTextField.backgroundColor = UIColor(red: 94.0/255.0, green: 230.0/255.0, blue: 240.0/255.0, alpha: 0.5)
        emailTextField.textColor = UIColor.black
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        emailTextField.textAlignment = .center
        emailTextField.placeholder = "email"
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(80)
            make.top.equalToSuperview().inset(300)
        }
        
        // MARK: - настройка поля пароль
        
        
        passwordTextField.backgroundColor = UIColor(red: 94.0/255.0, green: 230.0/255.0, blue: 240.0/255.0, alpha: 0.5)
        passwordTextField.textColor = UIColor.black
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "password"
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(80)
            make.top.equalTo(emailTextField).inset(50)
        }
        
        // MARK: - кнопка входа
        
        let buttonEnter = UIButton()
        buttonEnter.backgroundColor = .gray
        buttonEnter.layer.cornerRadius = 20
        buttonEnter.setTitleColor(.white, for: .normal)
        buttonEnter.setTitle("Let's go ->", for: .normal)
        view.addSubview(buttonEnter)
        buttonEnter.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(passwordTextField).inset(100)
        }
        
        
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Убрать клавиатуру")
        if textField == passwordTextField {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
}


