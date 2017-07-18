//
//  BaseService.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol BaseService {
    func handlerError<T>(code: Int) -> Result<T, Errors>
}

extension BaseService {
    
    func handlerError<T>(code: Int) -> Result<T, Errors> {
        
        switch (code) {
        case 401:
            return Result.failure(Errors.unauthorizedError)
        default:
            return Result.failure(Errors.undefinedError(description: "Ops! Algo deu errado."))
        }
        
    }
    
}
