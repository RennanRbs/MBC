//
//  CryptoInteractor.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 02/05/25.
//
import UIKit

protocol CryptoInteractorProtocol {
    func fetchCryptos()
}

class CryptoInteractor: CryptoInteractorProtocol {
    private let service: APIServiceProtocol
    private let presenter: CryptoPresenterInput

    init(service: APIServiceProtocol, presenter: CryptoPresenterInput) {
        self.service = service
        self.presenter = presenter
    }

    func fetchCryptos() {
        service.fetchCryptos { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cryptos):
                    self?.presenter.presentCryptos(cryptos)
                case .failure(let error):
                    self?.presenter.presentError(error.localizedDescription)
                }
            }
        }
    }
}
