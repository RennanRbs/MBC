//
//  ExchangeRatePresenter.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 02/05/25.
//

protocol CryptoPresenterInput {
    func presentCryptos(_ cryptos: [CryptoCurrency])
    func presentError(_ message: String)
}

protocol CryptoPresenterOutput: AnyObject {
    func displayCryptos(_ cryptos: [CryptoCurrency])
    func displayError(_ message: String)
}

class CryptoPresenter: CryptoPresenterInput {
    weak var output: CryptoPresenterOutput?

    init(output: CryptoPresenterOutput) {
        self.output = output
    }

    func presentCryptos(_ cryptos: [CryptoCurrency]) {
        output?.displayCryptos(cryptos)
    }

    func presentError(_ message: String) {
        output?.displayError(message)
    }
}
