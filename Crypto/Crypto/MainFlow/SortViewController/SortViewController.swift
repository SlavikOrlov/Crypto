//
//  SortViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 14.08.2022.
//

import UIKit

protocol SortViewControllerDelegate: AnyObject {
    func sortBy(option: SortBy)
}

class BonusViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SortViewCell.self,
                           forCellReuseIdentifier: SortViewCell.identifier)
        return tableView
    }()
    
    weak var delegate: SortViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Sorted by:"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = CustomColor.backgroundTableViewColor
    }
}

//MARK: - UITextFieldDelegate, UITableViewDataSource

extension BonusViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SortViewCell.identifier, for: indexPath)
        if let sortOption = SortBy(index: indexPath.row) {
            cell.textLabel?.text = sortOption.description
            cell.backgroundColor = CustomColor.backgroundTextColor
        
            if let objects = UserDefaults.standard.object(forKey: "selectedIndex") {
                let selectedIndex = UserDefaults.standard.integer(forKey: "selectedIndex")
                if sortOption == SortBy(rawValue: selectedIndex) {
                    cell.accessoryType = .checkmark
                }
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        cell?.backgroundColor = CustomColor.backgroundTextColor
        if let sortOption = SortBy(index: indexPath.row) {
            delegate?.sortBy(option: sortOption)
        }
        UserDefaults.standard.set(indexPath.row, forKey: "selectedIndex")
        dismiss(animated: true)
    }
}
