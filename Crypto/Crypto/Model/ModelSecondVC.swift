//
//  ModelSecondVC.swift
//  Crypto
//
//  Created by Slava Orlov on 11.08.2022.
//

import Foundation
import UIKit

final class ModelSecondVC {
    
    // MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    // MARK: - Properties
    
    var items: [SomeItem] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    // MARK: - Methods
    
    func getPosts() {
        items = Array(repeating: SomeItem.createDefault(), count: 20)
    }
}

