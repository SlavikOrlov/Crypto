//
//  DetailCoinsViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import UIKit

class DetailCoinsViewController: UIViewController {
    
    // MARK: - Constants
    
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coin1")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var symbol: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iconImage)
        view.backgroundColor = .systemGray6
        getInfo()
        addConstraints()
        
    }
    
    //MARK: - Private Methods
    
    private func getInfo() {
        if let symbol = symbol {
            DataExtraction.totalExemplar.getOneCoin(symbol: symbol) { [weak self] item in
                guard let item = item,
                      let self = self else { return }
            }
        }
    }
    
    private func addConstraints() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 40),
            iconImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40),
            iconImage.widthAnchor.constraint(equalToConstant: 120),
            iconImage.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}
