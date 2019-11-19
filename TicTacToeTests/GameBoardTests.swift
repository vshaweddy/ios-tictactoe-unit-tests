//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Vici Shaweddy on 11/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe // don't forget to import the project to the test project

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0))) // it doesn't throw an error
        XCTAssertEqual(board[(0,0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) {
            (error) in
            XCTAssertEqual(error as? GameBoardError,GameBoardError.invalidSquare) // downcast it -- look at the Gameboard.swift line 47
        }
    }

}
