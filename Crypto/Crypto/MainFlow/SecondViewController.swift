//
//  SecondVViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//


import UIKit

class SecondViewController: UIViewController {
    
    // MARK: Views
    
    private let tableView = UITableView()
    
    // MARK: - Properties
    
    private let model = ModelSecondVC.init()
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .lightGray
        configureAppearance()
        model.getPosts()
    }
}

// MARK: - Private Methods

private extension SecondViewController {
    
    func configureAppearance() {
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "\(ViewCellSecondVC.self)", bundle: .main), forCellReuseIdentifier: "\(ViewCellSecondVC.self)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}
// MARK: - UITableViewDataSource, UITableViewDelegate

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ViewCellSecondVC.self)")
        let item = model.items[indexPath.row]
        if let cell = cell as? ViewCellSecondVC {
            cell.title = item.title
            cell.content = item.content
        }
        return cell ?? UITableViewCell()
    }
}

