//
//  CryptoListViewController.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 02/05/25.
//

import UIKit

class CryptoListViewController: UIViewController, CryptoPresenterOutput, UITableViewDataSource, UITableViewDelegate {

    private var interactor: CryptoInteractorProtocol!
    private var cryptos: [CryptoCurrency] = []
    private let tableView = UITableView()

    init() { 
        super.init(nibName: nil, bundle: nil)
        let service = APIService()
        let presenter = CryptoPresenter(output: self)
        self.interactor = CryptoInteractor(service: service, presenter: presenter)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cryptos"
        view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.accessibilityIdentifier = "CryptoTableView"


        interactor.fetchCryptos()
    }

    func displayCryptos(_ cryptos: [CryptoCurrency]) {
        self.cryptos = cryptos
        tableView.reloadData()
    }

    func displayError(_ message: String) {
        print("Error: \(message)")
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let crypto = cryptos[indexPath.row]
        cell.textLabel?.text = "\(crypto.name) - $\(String(format: "%.2f", crypto.quote.USD.price))"
        return cell
    }

    // Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = CryptoDetailViewController(crypto: cryptos[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
