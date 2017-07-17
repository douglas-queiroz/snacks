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
        
        return price
    }
}
