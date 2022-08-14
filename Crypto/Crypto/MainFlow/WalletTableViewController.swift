//
//  SecondVViewController.swift
//  Crypto
//
//  Created by Slava Orlov on 10.08.2022.
//


import UIKit

class WalletViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    private var walletTableView = UITableView()
    let indentifire = "WalletCell"
    var array = ["1", "2", "3", "4"]
    //var model: DetailItemModel?
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wallet"
        background()
        configureAppearance()
        walletTableView.reloadData()
        //walletTableView.backgroundColor = CustomColor.gradientLayer
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    
}
    
// MARK: - Private Methods
    
private extension WalletViewController {
        
    func configureAppearance() {
        configureTableView()
        configureNavigationBar()
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
