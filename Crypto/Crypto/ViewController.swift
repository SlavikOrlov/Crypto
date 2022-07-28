//
//  ViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 24.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
    }
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        
        let imageCoin = UIImage()
        
        
        // MARK: - настройка поля логин
        
        let emailTextField = UITextField()
        
        emailTextField.backgroundColor = .lightGray
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
        
        let passwordTextField = UITextField()
        
        passwordTextField.backgroundColor = .lightGray
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
        
        let buttonEnter = UIButton(type: .system)
        buttonEnter.backgroundColor = .lightGray
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


}

