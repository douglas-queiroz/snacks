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
    
    func testCalculatePriceWithLightPromotion() {
        let lattucePrice = 1.0
        
        let snack = SnackModel()
        snack.ingredients = [IngredientsModel]()
        
        let ingredient = IngredientsModel()
        ingredient.name = Constants.Ingredients.lattuceIngredientName
        ingredient.price = lattucePrice
        snack.ingredients?.append(ingredient)
        
        XCTAssertEqual(snack.price, lattucePrice * 0.9)
    }
    
    func testCalculatePriceWithTooManyCheesePromotion() {
        let cheesePrice = 2.5
        
        let snack = SnackModel()
        snack.ingredients = [IngredientsModel]()
        
        let cheeseIngredient = IngredientsModel()
        cheeseIngredient.name = Constants.Ingredients.cheeseIngredientName
        cheeseIngredient.price = cheesePrice
        
        snack.ingredients?.append(cheeseIngredient)
        snack.ingredients?.append(cheeseIngredient)
        snack.ingredients?.append(cheeseIngredient)
        
        XCTAssertEqual(snack.price, (cheesePrice * 2))
    }
    
    func testCalculatePriceWithTooManyMeatPromotion() {
        let mealPrice = 2.5
        
        let snack = SnackModel()
        snack.ingredients = [IngredientsModel]()
        
        let meatIngredient = IngredientsModel()
        meatIngredient.name = Constants.Ingredients.meatIngredientName
        meatIngredient.price = mealPrice
        
        snack.ingredients?.append(meatIngredient)
        snack.ingredients?.append(meatIngredient)
        snack.ingredients?.append(meatIngredient)
        
        XCTAssertEqual(snack.price, (mealPrice * 2))
    }
    
}
