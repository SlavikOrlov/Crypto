//
//  CoinsModel.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

struct CoinsModel: Decodable {
    let data: [Items]
}

struct Items: Decodable {
    let symbol: String?
    let name: String
    let metrics: Metrics
    let profile: Profile
}

struct Metrics: Decodable {
    let market_data: MarketData
}

struct MarketData: Decodable {
    let price_usd: Double
    let percent_change_usd_last_24_hours: Double?
}

struct Profile: Decodable {
    let token_distribution: Token
}

struct Token: Decodable {
    let description: String?
}

struct Market {
    let price: Double
    var priceString: String {
        switch price {
        case 1... : return String(format: "%.2f", price)
        case 0.1..<1: return String(format: "%.3f", price)
        case 0.0001..<0.1: return String(format: "%.4f", price)
        case ..<0.0001: return String(format: "%.7f", price)
        default: return ""
        }
    }
    init?(marketData: MarketData) {
        price = marketData.price_usd
    }
}
