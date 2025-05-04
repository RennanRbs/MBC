//
//  APIService.swift
//  MyBCRBS
//
//  Created by Rennan Rebouças  on 04/05/25.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCryptos(completion: @escaping (Result<[CryptoCurrency], Error>) -> Void)
}

class APIService: APIServiceProtocol {
    private let baseURL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    private let apiKey = "f9280bea-52fe-4b1b-8442-47346ece6ad4"

    func fetchCryptos(completion: @escaping (Result<[CryptoCurrency], Error>) -> Void) {
        var urlComponents = URLComponents(string: baseURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "start", value: "1"),
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "convert", value: "USD")
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            do {
                let response = try JSONDecoder().decode(CoinMarketCapResponse.self, from: data)
                completion(.success(response.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
