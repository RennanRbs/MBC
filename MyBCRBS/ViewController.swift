//
//  ViewController.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 02/05/25.
//

import UIKit

class CryptoDetailViewController: UIViewController {
    private let crypto: CryptoCurrency

    init(crypto: CryptoCurrency) {
        self.crypto = crypto
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = crypto.name

        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name: \(crypto.name)\nSymbol: \(crypto.symbol)\nPrice: $\(String(format: "%.2f", crypto.quote.USD.price))"
        label.textAlignment = .center

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
