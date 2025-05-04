//
//  MockPresenter.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 04/05/25.
//
import Foundation
@testable import MyBCRBS

class MockPresenter: CryptoPresenterInput {
    var didCallPresentCryptos = false
    var didCallPresentError = false
    var receivedCryptos: [CryptoCurrency]?
    var receivedError: String?

    func presentCryptos(_ cryptos: [CryptoCurrency]) {
        didCallPresentCryptos = true
        receivedCryptos = cryptos
    }

    func presentError(_ message: String) {
        didCallPresentError = true
        receivedError = message
    }
}
