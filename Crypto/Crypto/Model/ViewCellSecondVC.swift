//
//  ViewCellSecondVC.swift
//  Crypto
//
//  Created by Slava Orlov on 11.08.2022.
//

import UIKit

class ViewCellSecondVC: UITableView {
    

    // MARK: - Views
    
    
    private var favoriteTitle: UILabel!
    private var favoriteContent: UILabel!
    
    // MARK: - Properties
    
    var title: String = "" {
        didSet {
            favoriteTitle.text = title
        }
    }
    
    var content: String = "" {
        didSet {
            favoriteContent.text = content
        }
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
}

// MARK: - Private Methods

private extension ViewCellSecondVC {
    
    func configureAppearance() {
        
        favoriteTitle.font = .systemFont(ofSize: 16, weight: .medium)
        favoriteContent.font = .systemFont(ofSize: 12, weight: .light)
        favoriteContent.numberOfLines = 1
    }
}
