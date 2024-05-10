//
//  Game.swift
//  KataTestSwift
//
//  Created by Sergio Ramirez on 12/04/24.
//

import Foundation

struct PlayerData{
    private var name: String
}

class Game {
    let playerA: Player
    let playerB: Player
    
    private var scorePlayerA:Int!
    private var scorePlayerB:Int!
    private let pointsCalculatorPlayerA:PointsCalculator!
    private let pointsCalculatorPlayerB:PointsCalculator!
    private var winner: Player?
    private var status: String?
    
    init(playerA: Player, playerB : Player, scorePlayerA_: Int, scorePlayerB_: Int) {
        self.playerA = playerA
        pointsCalculatorPlayerA = PointsCalculator(score_: scorePlayerA_)
        scorePlayerA = pointsCalculatorPlayerA.getScore()
        
        self.playerB = playerB
        pointsCalculatorPlayerB = PointsCalculator(score_: scorePlayerB_)
        scorePlayerB = pointsCalculatorPlayerB.getScore()
    }
    
    func pointForPlayerA(_ player: PlayerData) {
        if (playerACanAddPoint(player)) {
            scorePlayerA = pointsCalculatorPlayerA.addPoint()
            validateGameState()
        }else {
            winner = playerA
        }
        validateGameState()
    }
    
    func pointForPlayerB() {
        if (playerBCanAddPoint()) {
            scorePlayerB = pointsCalculatorPlayerB.addPoint()
            validateGameState()
        }else {
            winner = playerB
        }
        validateGameState()
    }

    
    func getWinner() -> Player? {
        return winner
    }
    
    func getState() -> String? {
        
        return status
    }
}
 
//MARK: pirvate functions
extension Game {
    private func validateGameState() {
        if (scorePlayerA == 40 && scorePlayerB == 40 ) {
            status = "deuce"
        }
    }
    
    private func playerACanAddPoint() -> Bool {
        if scorePlayerA == 40 {
            if status == "deuce" {
                return true
            }else {
                return false
            }
        }
        return true
    }
    
    private func playerBCanAddPoint() -> Bool {
        if scorePlayerB == 40 {
            if status == "deuce" {
                return true
            }else {
                return false
            }
        }
        return true
    }
}

