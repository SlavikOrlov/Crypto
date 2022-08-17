//
//  DataExtraction.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation

// Конкретные запросы данных для контроллеров
class DataExtraction {
    
    var dataFetcher: DataFetcher!
    static let totalExemplar = DataExtraction()
    
    private init(dataFetcher: DataFetcher = NetworkDataFetcher()){
        self.dataFetcher = dataFetcher
    }
    
    // Декордируем JSON данные в конкретную модель
    func getCoins (completion: @escaping (CoinsModel?) -> Void) {
        let urlCoins = "https://data.messari.io/api/v1/assets"
        dataFetcher.fetchGenericJSONData(
            urlString: urlCoins,
            response: completion
        )
    }
    
    func getOneCoin (symbol: String, completion: @escaping (OneCoinModel?) -> Void) {
        let urlOneCoin = "https://data.messari.io/api/v1/assets/\(symbol)/profile"
        dataFetcher.fetchGenericJSONData(
            urlString: urlOneCoin,
            response: completion
        )
    }
}
