//
//  CustomColor.swift
//  Crypto
//
//  Created by Slava Orlov on 12.08.2022.
//

import Foundation
import UIKit

enum CustomColor {
    static let textColor = UIColor.black
    static let backgroundTextColor = UIColor.lightGray
    static let buttonColor = UIColor.lightGray
    static let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = .zero
        layer.colors = [
            UIColor(red: 94.0/255.0, green: 230.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor,
            UIColor(red: 154.0/255.0, green: 61.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor,
            UIColor(red: 105.0/255.0, green: 18.0/255.0, blue: 213.0/255.0, alpha: 1.0).cgColor,
        ]
        return layer
    }()
}
