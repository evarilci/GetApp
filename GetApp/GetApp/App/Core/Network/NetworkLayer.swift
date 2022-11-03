//
//  NetworkLayer.swift
//  GetApp
//
//  Created by Eymen Varilci on 3.11.2022.
//

import Foundation
import Moya

let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
let provider = MoyaProvider<FakeStoreService>(plugins: [plugin])

enum FakeStoreService{
    case getProducts
}

extension FakeStoreService: TargetType {
    var baseURL: URL {
        return URL(string: "https://fakestoreapi.com")!
    }
    
    var path: String {
        switch self {
        case .getProducts :
            return "/products"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getProducts:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}