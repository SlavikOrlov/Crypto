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
        imageView.image = ExtensionImage.detailViewImage
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var symbol: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iconImage)
        view.backgroundColor = CustomColor.backgroundTableViewColor
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
            iconImage.topAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
