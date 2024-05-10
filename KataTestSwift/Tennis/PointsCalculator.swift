//
//  PointsCalculator.swift
//  KataTestSwift
//
//  Created by Sergio Ramirez on 8/03/24.
//

import Foundation

enum Point: Int, CaseIterable {
    case point_0 = 0
    case point_15 = 15
    case point_30 = 30
    case point_40 = 40
    
}

class PointsCalculator {
    private var score: Point
    private let allPoints: [Point] = Point.allCases
    
    init(score_: Int = 0) {
        if let point = Point(rawValue: score_) {
            score = point
        }else {
            score = .point_0
        }
    }
    
    func getScore() -> Int {
        return score.rawValue
    }
    
    func addPoint() -> Int {
        let nextPoint = getNextPoint()
        return updatePointIfNeeded(forNextPoint: nextPoint)
    }
    
    private func getNextPoint() -> Int {
        let actualIndex = getActualPointIndex()
        return actualIndex + 1
    }
    
    private func updatePointIfNeeded(forNextPoint point: Int) -> Int {
        if indexExistInAllPoints(point) {
            self.score = allPoints[point]
        }
        return self.score.rawValue
    }
    
    private func getActualPointIndex() -> Int {
        if let point = allPoints.firstIndex(of: self.score) {
            return point
        }
        return 0
    }
    
    private func indexExistInAllPoints(_ index: Int) -> Bool {
        return allPoints.indices.contains(index)
    }
}
