//
//  Color.swift
//  Crypto
//
//  Created by Slava Orlov on 28.07.2022.
//

import UIKit
import Foundation

// enum BackgroundColor {
//    static let backgroundColor = UIColor.green
//}

class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
    }
    
}

enum ButtonAppearance {
    static let backgroundColor = UIColor.green
    static let borderColor = UIColor.blue
    static let textColor = UIColor.black
}

