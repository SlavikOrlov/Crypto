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
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func configureAppearance() {
        backgroundColor = UIColor(red: 94.0/255.0, green: 230.0/255.0, blue: 240.0/255.0, alpha: 0.5)
        textColor = UIColor.black
        borderStyle = UITextField.BorderStyle.roundedRect
        contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        textAlignment = .center
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
}
