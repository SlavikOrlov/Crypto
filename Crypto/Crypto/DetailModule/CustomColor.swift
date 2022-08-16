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
    static let backgroundTextColor = UIColor(
        red: 212.0/255.0,
        green: 168.0/255.0,
        blue: 79.0/255.0,
        alpha: 1.0
    )
    static let backgroundTableViewColor = UIColor(
        red: 255.0/255.0,
        green: 203.0/255.0,
        blue: 61.0/255.0,
        alpha: 1.0
    )
    static let buttonColor = UIColor(
        red: 212.0/255.0,
        green: 168.0/255.0,
        blue: 79.0/255.0,
        alpha: 1.0
    )
    static let backgroundHeaderColor = UIColor(
        red: 255.0/255.0,
        green: 203.0/255.0,
        blue: 61.0/255.0,
        alpha: 1.0
    )
    static let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = .zero
        layer.colors = [
            UIColor(
                red: 255.0/255.0,
                green: 203.0/255.0,
                blue: 61.0/255.0,
                alpha: 1.0
            ).cgColor,
            UIColor(
                red: 23.0/255.0,
                green: 18.0/255.0,
                blue: 12.0/255.0,
                alpha: 1.0
            ).cgColor,
        ]
        return layer
    }()
}
