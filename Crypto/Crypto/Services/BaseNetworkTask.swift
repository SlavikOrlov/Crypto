//
//  BaseNetworkTask.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}
// Запрос данных через URL
class BaseNetworkTask: Networking {
    
    // Сам запрос данных
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.addValue("38a9ade2-470a-4c0c-9554-324414b0e831",
                         forHTTPHeaderField: "x-messari-api-key")
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    // Создание URLSessionDataTask
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async{
                completion(data,error)
            }
        }
    }
}
