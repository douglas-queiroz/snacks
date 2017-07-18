//
//  BaseAPI.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public enum BaseAPI {
    case snacks()
}

extension BaseAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }
    
    public var path: String {
        switch self {
        case .snacks():
            return "/lanche"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .snacks():
            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .snacks():
            return nil
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    
    public var sampleData: Data {
        let filename: String
        
        switch self {
        case .snacks():
            filename = "snacks.json"
        }
        
        if let sample = Bundle.main.path(forResource: filename, ofType: nil) {
            do {
                return try Data(contentsOf: URL(string: sample)!)
            } catch {
                return Data()
            }
        }
        
        return Data()
    }
    
    public var task: Task {
        return .request
    }
    
    public var validate: Bool {
        return false
    }
    
}
