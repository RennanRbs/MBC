//
//  MyBCRBSUITests.swift
//  MyBCRBSUITests
//
//  Created by Rennan Rebouças  on 02/05/25.
//

import XCTest

final class MyBCRBSUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    @MainActor
    func testCryptoListIsDisplayed() throws {
        let app = XCUIApplication()
        app.launch()

        let tableView = app.tables["CryptoTableView"]
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil) // <-- ESSA LINHA FALTAVA

        XCTAssertGreaterThan(tableView.cells.count, 0, "A lista de criptomoedas deve exibir ao menos uma célula")
    }
}
