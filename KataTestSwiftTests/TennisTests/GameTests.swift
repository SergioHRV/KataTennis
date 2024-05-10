//
//  GameTests.swift
//  KataTestSwiftTests
//
//  Created by Sergio Ramirez on 12/04/24.
//

import XCTest
@testable import KataTestSwift

final class GameTests: XCTestCase {

    var game: Game!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func test_if_a_playerA_in_game_have_max_points_win() {
        //Given
        givenAGameWithAPlayersThatHavePoints(scorePlayerA: 40, scorePlayerB: 0)
    
        //When
        game.pointForPlayerA()
            
        //Then
        let expectedPlayer = Player(name: "Esteban")
        XCTAssertEqual(expectedPlayer, game.getWinner())
    }
    
    func test_if_a_playerB_in_game_have_max_points_win() {
        //Given
        givenAGameWithAPlayersThatHavePoints(scorePlayerA: 0, scorePlayerB: 40)
    
        //When
        game.pointForPlayerB()
            
        //Then
        let expectedPlayer = Player(name: "Sergio")
        XCTAssertEqual(expectedPlayer, game.getWinner())
    }
    
    func test_if_a_player_in_game_have_30_points_dont_win() {
        //Given
        givenAGameWithAPlayersThatHavePoints(scorePlayerA: 30, scorePlayerB: 0)
    
        //When
        game.pointForPlayerA()
            
        
        //Then
        XCTAssertNil(game.getWinner())
    }
    
    func test_when_two_players_are_max_point_equals_the_status_is_deuce() {
        //Given
        givenAGameWithAPlayersThatHavePoints(scorePlayerA: 40, scorePlayerB: 30)
        
        //When
        game.pointForPlayerB()
        
        //Then
        
        XCTAssertEqual(game.getState(), "deuce")
    }
    
    //MARK: Given
    
    func givenAGameWithAPlayersThatHavePoints(scorePlayerA : Int, scorePlayerB : Int) {
        let playerA = Player(name: "Esteban")
        let playerB = Player(name: "Sergio")
        game = Game(playerA: playerA, playerB: playerB, scorePlayerA_: scorePlayerA, scorePlayerB_: scorePlayerB)
    }
}



