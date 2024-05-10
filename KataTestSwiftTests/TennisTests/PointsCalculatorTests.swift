//
//  PointsCalculatorTests.swift
//  KataTestSwiftTests
//
//  Created by Sergio Ramirez on 8/03/24.
//

import XCTest
@testable import KataTestSwift

final class PointsCalculatorTests: XCTestCase {

    var calculator:PointsCalculator!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    //TODO: Organizar por metodos individulaes de given, when y then

    func test_should_have_score_15_for_a_point() {
        givenAPointCalculator()
        
        //When
        let score = calculator.addPoint()
        
        //Then
        let expectedScore = 15
        XCTAssertEqual(score, expectedScore)
    }

    func test_should_have_score_30_for_two_points() {
        givenAPointCalculator(withOnePoints: 15)
        
        //When
        let score = calculator.addPoint()
        
        //Then
        let expectedScore = 30
        XCTAssertEqual(score, expectedScore)
    }
    
    func test_should_have_score_40_for_tree_points() {
        givenAPointCalculator(withOnePoints: 30)
        
        //When
        let score = calculator.addPoint() //cuando hago el tercer punto
        
        //Then
        let expectedScore = 40
        XCTAssertEqual(score, expectedScore) //entonces el marcador es 40
    }
    
    func test_should_not_score_more_thant_40() {
        givenAPointCalculator(withOnePoints: 40)
        
        //When
        let score = calculator.addPoint()
        
        //Then
        let expectedScore = 40
        XCTAssertEqual(score, expectedScore)
    }

    //MARK: Given
    
    func givenAPointCalculator(){
        calculator = PointsCalculator()
    }
    
    func givenAPointCalculator(withOnePoints points: Int){
        calculator = PointsCalculator(score_: points)
    }
}
