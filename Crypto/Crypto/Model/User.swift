//
//  User.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

struct User {
    var login: String
    var password: String
    
    static func getUser() -> User {
        User(login: "S", password: "1")
    }
}
