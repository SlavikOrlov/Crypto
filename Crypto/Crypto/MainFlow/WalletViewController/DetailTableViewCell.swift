//
//  DetailTableViewCell.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let indentifier = "CryptoTableViewCell"
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = CustomColor.textColor
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.textColor
        label.textAlignment = .left
        return label
    }()
    
    private let percentChange24HoursLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(percentChange24HoursLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        firstNameLabel.frame = CGRect(
            x: 20,
            y: 5,
            width: 90,
            height: contentView.frame.size.height - 10
        )
        
        priceLabel.frame = CGRect(
            x: 30 + firstNameLabel.frame.size.width,
            y: 5,
            width: 100,
            height: contentView.frame.size.height - 10
        )
        
        percentChange24HoursLabel.frame = CGRect(
            x: 60 + priceLabel.frame.maxX,
            y: 5,
            width: 60,
            height: contentView.frame.size.height - 10)
    }
    
    //MARK: - Private Methods
    
    func configure(with coinsModel: Items) {
        DispatchQueue.main.async {
            self.firstNameLabel.text = coinsModel.name
            self.roundedDouble(with: coinsModel)
            self.percentChange24HoursLabel.text = String(format: "%.2f", coinsModel.metrics.market_data.percent_change_usd_last_24_hours ?? 0.00) + "%"
        }
    }
    private func roundedDouble(with coinModel: Items) {
        if let marketData = Market(marketData: coinModel.metrics.market_data) {
            priceLabel.text = marketData.priceString + " $"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = CustomColor.backgroundTableViewColor
    }
}
