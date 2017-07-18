//
//  Snack.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation
import Mapper

struct Snack: Mappable {
    var name: String?
    var image: String?
    var ingredients: [IngredientsModel]?
    
    init(map: Mapper) throws {
        name = map.optionalFrom("name")
        image = map.optionalFrom("image")
    }
}
