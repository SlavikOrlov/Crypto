//
//  SecondVViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//


import UIKit

class WalletViewController: UIViewController {
    
    // MARK: - Properties
    
    private var walletTableView = UITableView()
    let indentifire = "WalletCell"
    var array = ["1", "2", "3", "4"]
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        walletTableView.reloadData()
        walletTableView.backgroundColor = UIColor.lightGray
    }
}
    
// MARK: - Private Methods
    
private extension WalletViewController {
        
    func configureAppearance() {
        configureTableView()
        //background()
    }
        
    func configureTableView() {
        walletTableView = UITableView(frame: view.bounds, style: .plain)
        walletTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        walletTableView.delegate = self
        walletTableView.dataSource = self
        //walletTableView.backgroundColor = UIColor.red //сделать градиент
            
        walletTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(walletTableView)
        }
}
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        
        let number = array[indexPath.row]
        cell.textLabel?.text = number
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
