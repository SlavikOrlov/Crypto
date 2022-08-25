//
//  DataExtraction.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation

class DataExtraction {
    
    var dataFetcher: DataFetcher!
    static let totalExemplar = DataExtraction()
    
    private init(dataFetcher: DataFetcher = NetworkDataFetcher()){
        self.dataFetcher = dataFetcher
    }
    
    func getCoins (completion: @escaping (CoinsModel?) -> Void) {
        let urlCoins = "https://data.messari.io/api/v1/assets"
        dataFetcher.fetchGenericJSONData(
            urlString: urlCoins,
            response: completion
        )
    }
}
