//
//  ExchangeRateModels.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 02/05/25.
//

import Foundation

struct CoinMarketCapResponse: Codable {
    let data: [CryptoCurrency]
}

struct CryptoCurrency: Codable {
    let id: Int
    let name: String
    let symbol: String
    let quote: Quote

    struct Quote: Codable {
        let USD: USDQuote
    }

    struct USDQuote: Codable {
        let price: Double
    }
}

