//
//  Gettable.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol Gettable {
    
    associatedtype DataArray
    associatedtype Data
    
    func get(completion: @escaping (Result<DataArray, Errors>) -> Void)
    func get(id: Int, completion: (Result<Data, Errors>) -> Void)
}
