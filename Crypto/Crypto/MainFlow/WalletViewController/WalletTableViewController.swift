//
//  WalletViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//


import UIKit

class WalletViewController: UIViewController {
    
    // MARK: - Properties
    
    var coins: [Items]!
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(DetailTableViewCell.self, forCellReuseIdentifier: "CryptoTableViewCell")
        return table
    }()
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.backgroundColor = CustomColor.backgroundTableViewColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        title = "CryptoWallet"
        setupNavigation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        getsCoins()
        
    }
    
    // MARK: - Private Methods
    
    private func setupNavigation() {
        let sortButton = UIBarButtonItem(
            image: UIImage(named: "sortTab"),
            style: .plain,
            target: self,
            action: #selector(presentModalController)
        )
        navigationItem.rightBarButtonItem = sortButton
        navigationController?.navigationBar.tintColor = .black

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    private func getsCoins() {
        DataExtraction.totalExemplar.getCoins { [weak self] coinsModel in
            guard let coinsModel = coinsModel,
                  let self = self else { return }
            self.coins = coinsModel.data
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! DetailTableViewCell
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        cell.backgroundColor = CustomColor.backgroundTextColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @objc func presentModalController() {
        let bonusViewController = BonusViewController()
        bonusViewController.delegate = self
        let nav = UINavigationController(rootViewController: bonusViewController)
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(nav, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailCoinsViewController()
        detailVC.symbol = coins[indexPath.row].symbol
        
        present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.size.width,
                height: 50)
        )
        header.backgroundColor = CustomColor.backgroundHeaderColor
        
        let firstNameLabel = UILabel(
            frame: CGRect(
                x: 20,
                y: 5,
                width: 90,
                height: header.frame.size.height - 10)
        )
        firstNameLabel.text = "Name"
        firstNameLabel.font = .boldSystemFont(ofSize: 16)
        
        let priceLabel = UILabel(
            frame: CGRect(
                x: 30 + firstNameLabel.frame.width,
                y: 5,
                width: 100,
                height: header.frame.size.height - 10)
        )
        priceLabel.text = "Price"
        priceLabel.font = .boldSystemFont(ofSize: 16)
        
        
        let change24HoursLabel = UILabel(
            frame: CGRect(
                x: 10 + priceLabel.frame.maxX,
                y: 5,
                width: 180,
                height: header.frame.size.height - 10)
        )
        change24HoursLabel.text = "Change for 24 hours"
        change24HoursLabel.numberOfLines = 1
        change24HoursLabel.font = .boldSystemFont(ofSize: 16)
        
        header.addSubview(firstNameLabel)
        header.addSubview(priceLabel)
        header.addSubview(change24HoursLabel)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension WalletViewController: SortViewControllerDelegate {
    
    func sortBy(option: SortBy) {
        switch option {
            
        case .fallingPerDay:
            coins = coins.sorted(by: { $0.metrics.market_data.percent_change_usd_last_24_hours ?? 0 > $1.metrics.market_data.percent_change_usd_last_24_hours ?? 0
            })
        case .growthPerDay:
            coins = coins.sorted(by: { $0.metrics.market_data.percent_change_usd_last_24_hours ?? 0 < $1.metrics.market_data.percent_change_usd_last_24_hours ?? 0
            })
        }
        tableView.reloadData()
    }
}
