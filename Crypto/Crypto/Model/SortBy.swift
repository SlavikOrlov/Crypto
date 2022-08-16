//
//  SortBy.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation

enum SortBy: Int {
    case fallingPerDay
    case growthPerDay
    
    init?(index: Int) {
            switch index {
            case 0: self = .fallingPerDay
            case 1: self = .growthPerDay
            default:
                return nil
            }
        }
    
    var description: String? {
        get {
            switch self {
            case .fallingPerDay: return "Drop in a day ↓"
            case .growthPerDay: return "Increase per day ↑"
            }
        }
    }
}
