//
//  ItemSecondVC.swift
//  Crypto
//
//  Created by Slava Orlov on 11.08.2022.
//

import Foundation
import UIKit

struct SomeItem {
    let title: String
    let content: String
    
    static func createDefault() -> SomeItem {
        .init(title: "Первый день", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один")
    }
}
