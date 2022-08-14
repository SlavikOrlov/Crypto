//
//  DetailItemModel.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {

    // MARK: - Internal Properties

    let title: String

    // MARK: - Initialization

    internal init(title: String) {
        self.title = title
    }

    // MARK: - Internal methods

    static func createDefault() -> DetailItemModel {
        .init(
            title: "Самый милый корги"
        )
    }
}

