//
//  ExtensionButton.swift
//  Crypto
//
//  Created by Slava Orlov on 24.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func createCustomButton(titleName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.tintColor = CustomColor.textColorButton
        button.setTitle(titleName, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(
            self,
            action: selector,
            for: .touchUpInside
        )
        let menuBarItem =  UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
