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
    
}
