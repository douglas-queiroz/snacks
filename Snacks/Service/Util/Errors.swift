//
//  Errors.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

enum Errors: Error {
    case jsonMappingError
    case unauthorizedError
    case undefinedError(description: String)
    
    func message() -> String {
        switch self {
        case .jsonMappingError:
            return "Não foi possível Mapear o JSON"
        case .unauthorizedError:
            return "Não autorizado"
        case .undefinedError(let description):
            return description
        }
    }
    
    static let allErrors = [jsonMappingError, unauthorizedError, undefinedError(description: "")]
}
