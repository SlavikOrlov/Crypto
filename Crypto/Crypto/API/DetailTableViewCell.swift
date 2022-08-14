//
//  DetailTableViewCell.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

class DetailTableViewCellModel {
    let name: String
    let symbol: String
    let price: String
    let iconUrl: URL?
    var iconData: Data?
    
    init(name: String,
         symbol: String,
         price: String,
         iconUrl: URL?
        ) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconUrl = iconUrl
    }
}

class DetailTableViewCell: UITableViewCell {
    
    static let indentifier = "CryptoTableViewCell"

    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.textColor
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.textColor
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.textColor
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.contentMode = .scaleAspectFit
        return imageVIew
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(secondNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        
        iconImageView.frame = CGRect(
            x: 20,
            y: (contentView.frame.size.height-size)/2,
            width: size,
            height: size
        )
        
        firstNameLabel.sizeToFit()
        priceLabel.sizeToFit()
        secondNameLabel.sizeToFit()
        
        firstNameLabel.frame = CGRect(
            x: 30 + size,
            y: 0,
            width: contentView.frame.size.width/2,
            height: contentView.frame.size.height/2
        )
        
        secondNameLabel.frame = CGRect(
            x: 30 + size,
            y: contentView.frame.size.height/2,
            width: contentView.frame.size.width/2,
            height: contentView.frame.size.height/2
        )

        priceLabel.frame = CGRect(
            x: contentView.frame.size.width/2,
            y: 0,
            width: (contentView.frame.size.width/2) - 15,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        firstNameLabel.text = nil
        priceLabel.text = nil
        secondNameLabel.text = nil
    }
    
    func configure(with viewModel: DetailTableViewCellModel) {
        firstNameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        secondNameLabel.text = viewModel.symbol
        
        if let data = viewModel.iconData {
            iconImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.iconUrl {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                if let data = data {
                    viewModel.iconData = data
                    DispatchQueue.main.async {
                        self?.iconImageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
}
