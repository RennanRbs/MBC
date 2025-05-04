//
//  MockAPIService.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 04/05/25.
//

import XCTest
@testable import MyBCRBS

class MockAPIService: APIServiceProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetchCryptos(completion: @escaping (Result<[CryptoCurrency], Error>) -> Void) {
        fetchCalled = true

        if shouldReturnError {
            let error = NSError(domain: "MockError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Erro simulado"])
            completion(.failure(error))
        } else {
            let mockCrypto = CryptoCurrency(id: 1,
                                            name: "Bitcoin",
                                            symbol: "BIT",
                                            quote: CryptoCurrency.Quote(USD: CryptoCurrency.USDQuote(price: 6.0000))
            )
            completion(.success([mockCrypto]))
        }
    }
}
