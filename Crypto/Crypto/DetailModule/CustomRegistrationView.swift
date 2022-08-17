//
//  CustomRegistrationView.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//

import Foundation
import UIKit

final class CustomRegistrationView: UIView {
    
    var buttonAction: (() -> Void)?    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainLabel)
        setupVerticalStackView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Constants
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Crypto"
        label.font = UIFont(name: "Noteworthy", size: 50)
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.backgroundColor = CustomColor.backgroundTextColor
        textField.textColor = CustomColor.textColor
        textField.attributedPlaceholder = NSAttributedString(
            string: "login",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.textAlignment = .center
        textField.clearButtonMode = .always
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.backgroundColor = CustomColor.backgroundTextColor
        textField.textColor = CustomColor.textColor
        textField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.textAlignment = .center
        textField.clearButtonMode = .always
        return textField
    }()
    
    let buttonEnter: UIButton = {
        let button = UIButton()
        button.backgroundColor = CustomColor.buttonColor
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Enter", for: .normal)
        button.addTarget(
            self,
            action: #selector(tapButtonEnter),
            for: .touchUpInside
        )
        return button
}()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    //MARK: - Private Methods

    private func setupVerticalStackView() {
        verticalStackView.addArrangedSubview(emailTextField)
        verticalStackView.addArrangedSubview(passwordTextField)
        verticalStackView.addArrangedSubview(buttonEnter)
        addSubview(verticalStackView)
    }
    
    private func setupLayout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 210),
            mainLabel.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            verticalStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 140),
            buttonEnter.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func tapButtonEnter() {
        buttonAction?()
    }
    
}
