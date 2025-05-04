//
//  MyBCRBSTests.swift
//  MyBCRBSTests
//
//  Created by Rennan Rebouças  on 02/05/25.
//

import Testing
@testable import MyBCRBS

struct CryptoInteractorTests {
    
    @Test
    func testFetchCryptosSuccess() async throws {
        // Arrange
        let mockService = MockAPIService()
        let mockPresenter = MockPresenter()
        let interactor = CryptoInteractor(service: mockService, presenter: mockPresenter)

        // Act
        interactor.fetchCryptos()
        try await Task.sleep(nanoseconds: 100_000_000) // aguarda para garantir execução no DispatchQueue.main

        // Assert
        #expect(mockService.fetchCalled)
        #expect(mockPresenter.didCallPresentCryptos)
        #expect(!mockPresenter.didCallPresentError)
        #expect(mockPresenter.receivedCryptos?.first?.name == "Bitcoin")
    }

    @Test
    func testFetchCryptosFailure() async throws {
        // Arrange
        let mockService = MockAPIService()
        mockService.shouldReturnError = true
        let mockPresenter = MockPresenter()
        let interactor = CryptoInteractor(service: mockService, presenter: mockPresenter)

        // Act
        interactor.fetchCryptos()
        try await Task.sleep(nanoseconds: 100_000_000)

        // Assert
        #expect(mockService.fetchCalled)
        #expect(!mockPresenter.didCallPresentCryptos)
        #expect(mockPresenter.didCallPresentError)
        #expect(mockPresenter.receivedError == "Erro simulado")
    }
}

