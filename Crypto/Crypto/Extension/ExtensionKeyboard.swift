//
//  ExtensionKeyboard.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
   
    //MARK: - Keyboard
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - Private Methods

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
