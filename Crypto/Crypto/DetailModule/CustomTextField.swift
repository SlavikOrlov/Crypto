//
//  CustomTextField.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//

import Foundation
import UIKit

final class CustomTextField: UITextField, UITextFieldDelegate {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    //MARK: - Private Methods
    
    private func configureAppearance() {
        backgroundColor = CustomColor.backgroundTextColor
        textColor = CustomColor.textColor
        borderStyle = UITextField.BorderStyle.roundedRect
        contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        textAlignment = .center
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
}
