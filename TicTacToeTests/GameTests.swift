//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Vici Shaweddy on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testRestart() throws {
        var game = Game()
        try game.makeMark(at: (1, 0))
        XCTAssertEqual(game.activePlayer, .o)
        game.restart()
        XCTAssertEqual(game.activePlayer, .x)
    }
    
    func testMakeMark() throws {
        var game = Game()
        try game.makeMark(at: (1, 0))
        let mark = game.board[(1, 0)]
        XCTAssertEqual(mark, .x)
    }
}