//
//  Snack.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import UIKit

class SnackModel: BaseModel {

    var name: String?
    var image: String?
    var ingredients: [IngredientsModel]?
    var price: Double {
        var price = 0.0
        
        guard let ingredients = ingredients else {
            return price
        }
        
        for ingredient in ingredients {
            if let ingredientPrice = ingredient.price {
                price += ingredientPrice
            }
        }
        
        price = price - checkTooManyMeatPromotion(ingredients: ingredients)
        
        price = price - getTooManyCheesePromotion(ingredients: ingredients)
        
        if isLigthPromotion(ingredients: ingredients) {
            price = price * 0.9
        }
        
        return price
    }
    
    func isLigthPromotion(ingredients: [IngredientsModel]) -> Bool{        
        var hasLattuce = false
        var hasBacon = false
        
        for ingredient in ingredients {
            if let ingredientName = ingredient.name {
                if ingredientName == Constants.Ingredients.lattuceIngredientName {
                    hasLattuce = true
                }
                
                if ingredientName == Constants.Ingredients.baconIngredientName {
                    hasBacon = true
                }
            }
        }
        
        return hasLattuce && !hasBacon
    }
    
    private func checkTooManyMeatPromotion(ingredients: [IngredientsModel]) -> Double{
        return self.getSaveFromTooManyPromotion(withItem: Constants.Ingredients.meatIngredientName, fromIngredientes: ingredients)
    }
    
    private func getTooManyCheesePromotion(ingredients: [IngredientsModel]) -> Double{
        return self.getSaveFromTooManyPromotion(withItem: Constants.Ingredients.cheeseIngredientName, fromIngredientes: ingredients)
    }
    
    private func getSaveFromTooManyPromotion(withItem itemName: String, fromIngredientes ingredients: [IngredientsModel]) -> Double {
        var qtItem = 0.0
        var itemPrice = 0.0
        
        for ingredient in ingredients {
            
            if let ingredientName = ingredient.name,
                let ingredientPrice = ingredient.price {
                
                if ingredientName == itemName {
                    qtItem = qtItem + 1
                }
                
                itemPrice = ingredientPrice
                
            }
            
        }
        
        let qtdSaved = Int(qtItem / 3)
        let priceSaved = Double(qtdSaved) * itemPrice
        
        return priceSaved
    }
}
