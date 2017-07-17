//
//  SnackModelTests.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import XCTest
@testable import Snacks

class SnackModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCalculateSnackPrice() {
        let price1 = 2.5
        let price2 = 3.2
        let price3 = 2.1
        
        
        let snack = SnackModel()
        snack.ingredients = [IngredientsModel]()
        
        let ingredient1 = IngredientsModel()
        ingredient1.price = price1
        snack.ingredients?.append(ingredient1)
        
        let ingredient2 = IngredientsModel()
        ingredient2.price = price2
        snack.ingredients?.append(ingredient2)
        
        let ingredient3 = IngredientsModel()
        ingredient3.price = price3
        snack.ingredients?.append(ingredient3)
        
        
        XCTAssertEqual(snack.price, (price1 + price2 + price3))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
