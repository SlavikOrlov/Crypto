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
    
    var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coin Name"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Coin Description and Information"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var symbol: String?
    
    // MARK: - Lifecyrcle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(iconImage)
        view.addSubview(firstNameLabel)
        view.addSubview(descriptionLabel)
        view.backgroundColor = CustomColor.backgroundTableViewColor
        addConstraints()
        
    }
    
    //MARK: - Private Methods
    
    private func addConstraints() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 50
            ),
            iconImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            firstNameLabel.topAnchor.constraint(
                equalTo: iconImage.bottomAnchor,
                constant: 50
            ),
            firstNameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 150
            ),
            firstNameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -150
            ),
            firstNameLabel.heightAnchor.constraint(
                equalToConstant: 50
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: firstNameLabel.bottomAnchor,
                constant: 30
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 50
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -50
            ),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
    }
}
