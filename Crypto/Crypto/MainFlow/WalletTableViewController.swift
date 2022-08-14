//
//  WalletViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//


import UIKit

class WalletViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.indentifier)
        return table
    }()
    
    private var viewModels = [DetailTableViewCellModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "us_US")
        formatter.allowsFloats = true
        formatter.formatterBehavior = .default
        formatter.numberStyle = .currency
        return formatter
    }()
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        configureNavigationBar()
        
        //background()
        //configureAppearance()
        
        СallerNetwork.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    // NumberFormater
                    let price = model.price_usd ?? 0
                    let formatter = WalletViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    let iconUrl = URL(
                        string:
                            СallerNetwork.shared.icons.filter({ icon in
                                icon.asset_id == model.asset_id
                            }).first?.url ?? ""
                    )
                    
                    return DetailTableViewCellModel (
                        name: model.name ?? "N/A",
                        symbol: model.asset_id,
                        price: priceString ?? "N/A",
                        iconUrl: iconUrl
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        configureNavigationBar()
//    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}
    
// MARK: - Private Methods
/*

private extension WalletViewController {

    func configureAppearance() {
        configureTableView()
        configureNavigationBar()
    }
}
    private func background() {
        let gradientLayer: CAGradientLayer = CustomColor.gradientLayer
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
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
    
    func configureNavigationBar() {
        //navigationItem.title = model?.title
        let backButton = UIBarButtonItem(image: UIImage(named: "back-button"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
    */
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.indentifier, for: indexPath) as? DetailTableViewCell else { fatalError() }
         cell.configure(with: viewModels[indexPath.row])
         return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

