//
//  Result.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

enum Result<T, Errors> {
    case success(T)
    case failure(Errors)
}
