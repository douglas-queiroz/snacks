//
//  SnackService.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper

struct SnackService: BaseService, Gettable {
    
    private let provider: MoyaProvider<BaseAPI> = MoyaProvider<BaseAPI>()
    
    func get(completion: @escaping (Result<[Snack], Errors>) -> Void) {
        provider.request(.snacks()) { (result) in
            switch result {
            case .success(let response):
                do {
                    
                    if response.statusCode == 200 {
                        let snack: [Snack] = try response.mapArray() as [Snack]
                        completion(Result.success(snack))
                    } else {
                        completion(self.handlerError(code: response.statusCode) as Result<[Snack], Errors>)
                    }
                    
                } catch MoyaError.jsonMapping(response) {
                    completion(Result.failure(Errors.jsonMappingError))
                } catch {
                    completion(Result.failure(Errors.undefinedError(description: "Ops! Algo deu errado.")))
                }
            case .failure(let error):
                var statusCode: Int = 0
                
                if let response = error.response {
                    statusCode = response.statusCode
                }
                
                completion(self.handlerError(code: statusCode) as Result<[Snack], Errors>)
                
            }
        }
    }
    
    func get(id: Int, completion: (Result<Snack, Errors>) -> Void) {
        
    }
}
