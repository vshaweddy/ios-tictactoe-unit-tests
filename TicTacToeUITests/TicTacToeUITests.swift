//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Vici Shaweddy on 11/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeftVertical() {
        // UI tests must launch the application that they test
        let app = XCUIApplication()
        app.launch()
        
        // X starts the game
        let statusLabel = app.staticTexts["status"]
        
        // Tap "X" starts the game
//        let topLeftButton = app.buttons["topLeft"]
//        topLeftButton.tap()
//        XCTAssertEqual(topLeftButton.label, "X")
//        XCTAssertEqual(statusLabel.label, "Player O's turn")
        app.assertMovePlayed(app: app, statusLabel: statusLabel, buttonIdentifier: .topLeft, buttonLabelAssertion: .X, nextPlayerAssertion: .O)
        app.assertMovePlayed(app: app, statusLabel: statusLabel, buttonIdentifier: .topRight, buttonLabelAssertion: .O, nextPlayerAssertion: .X)
        app.assertMovePlayed(app: app, statusLabel: statusLabel, buttonIdentifier: .middleLeft, buttonLabelAssertion: .X, nextPlayerAssertion: .O)
        app.assertMovePlayed(app: app, statusLabel: statusLabel, buttonIdentifier: .middleRight, buttonLabelAssertion: .O, nextPlayerAssertion: .X)

//        // Tap "O" on the top right
//        let topRightButton = app.buttons["topRight"]
//        topRightButton.tap()
//        XCTAssertEqual(topRightButton.label, "O")
//        XCTAssertEqual(statusLabel.label, "Player X's turn")
//
//        // Tap "X" starts the game
//        let middleLeftButton = app.buttons["middleLeft"]
//        middleLeftButton.tap()
//        XCTAssertEqual(middleLeftButton.label, "X")
//        XCTAssertEqual(statusLabel.label, "Player O's turn")
//
//        // Tap "O" on the top right
//        let middleRightButton = app.buttons["middleRight"]
//        middleRightButton.tap()
//        XCTAssertEqual(middleRightButton.label, "O")
//        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
        // Tap "X" starts the game
        let bottomLeftButton = app.buttons["bottomLeft"]
        bottomLeftButton.tap()
        XCTAssertEqual(bottomLeftButton.label, "X")
        
        XCTAssertEqual(statusLabel.label, "Player X won!")
    }
    

    

    
    func testDiagonal() {
        let app = XCUIApplication()
        app.launch()
        
        // X starts the game
        let statusLabel = app.staticTexts["status"]
        
        // Tap "X" starts the game
        let topLeftButton = app.buttons["topLeft"]
        topLeftButton.tap()
        XCTAssertEqual(topLeftButton.label, "X")
        XCTAssertEqual(statusLabel.label, "Player O's turn")

        // Tap "O" on the top right
        let topRightButton = app.buttons["topRight"]
        topRightButton.tap()
        XCTAssertEqual(topRightButton.label, "O")
        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
        // Tap "X" starts the game
        let middleCenter = app.buttons["middleCenter"]
        middleCenter.tap()
        XCTAssertEqual(middleCenter.label, "X")
        XCTAssertEqual(statusLabel.label, "Player O's turn")

        // Tap "O" on the top right
        let middleRightButton = app.buttons["middleRight"]
        middleRightButton.tap()
        XCTAssertEqual(middleRightButton.label, "O")
        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
        // Tap "X" starts the game
        let bottomRightButton = app.buttons["bottomRight"]
        bottomRightButton.tap()
        XCTAssertEqual(bottomRightButton.label, "X")
        
        XCTAssertEqual(statusLabel.label, "Player X won!")
    }
}

extension XCUIApplication {
    enum PositionIdentifier: String {
        case topLeft
        case topCenter
        case topRight
        case middleLeft
        case middleCenter
        case middleRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    
    enum ButtonLabel: String {
        case X
        case O
    }
    
    var statusElement: XCUIElement {
        return staticTexts["status"]
    }
    
    func assertMovePlayed(app: XCUIApplication,
                          statusLabel: XCUIElement,
                          buttonIdentifier: PositionIdentifier,
                          buttonLabelAssertion: ButtonLabel,
                          nextPlayerAssertion: ButtonLabel) {
        let button = app.buttons[buttonIdentifier.rawValue]
        button.tap()
        XCTAssertEqual(button.label, buttonLabelAssertion.rawValue)
        XCTAssertEqual(statusLabel.label, "Player \(nextPlayerAssertion.rawValue)'s turn")
    }
}
